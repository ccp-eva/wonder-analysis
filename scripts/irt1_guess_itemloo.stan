// generated with brms 2.18.0
functions {
  real irt_marg_lik(
    real x,
    real xc,
    real[] pars,
    real[] real_data,
    int[] int_data
  ) {
    int N_1 = int_data[1];
    int Y[N_1] = tail(int_data, N_1);
    real Intercept = pars[1];
    real sd_2 = pars[2];
    vector[N_1] sd_1_x_z_1 = to_vector(tail(pars, N_1));
    vector[N_1] nlp_eta = Intercept + sd_1_x_z_1 + sd_2 * x;

    return exp(bernoulli_lpmf(Y | .25 + .75 * inv_logit(nlp_eta)) + std_normal_lpdf(x));
  }
}
data {
  int<lower=1> N;  // total number of observations
  int Y[N];  // response variable
  // data for group-level effects of ID 1
  int<lower=1> N_1;  // number of grouping levels
  int<lower=1> J_1[N];  // grouping indicator per observation
  // data for group-level effects of ID 2
  int<lower=1> N_2;  // number of grouping levels
  int<lower=1> J_2[N];  // grouping indicator per observation
}
transformed data{
  int Y_wide[N_1, N_2];
  matrix[N_1, N_2] Y_wide_mat;
  int integration_data[N_2, N_1 + 1];
  row_vector<lower=1.0, upper=1.0>[N_1] onevec_N_1 = rep_row_vector(1.0, N_1);
  for (n in 1:N) {
    Y_wide[J_1[n], J_2[n]] = Y[n];
  }
  Y_wide_mat = to_matrix(Y_wide);
  for (k in 1:N_2) {
    integration_data[k] = append_array({ N_1 }, Y_wide[, k]);
  }
}
parameters {
  real b_eta;  // population-level effects
  real<lower=0.0> sd_1;  // group-level standard deviations
  vector[N_1] z_1;  // standardized group-level effects
  real<lower=0.0> sd_2;  // group-level standard deviations
  vector[N_2] z_2;  // standardized group-level effects
}
transformed parameters {
  vector[N_1] r_1_eta_1 = sd_1 * z_1;  // actual group-level effects
  vector[N_2] r_2_eta_1 = sd_2 * z_2;  // actual group-level effects
}
model {
  // likelihood including constants
  vector[N] nlp_eta = b_eta + r_1_eta_1[J_1] + r_2_eta_1[J_2];
  vector[N] mu = .25 + .75 * inv_logit(nlp_eta);
  target += bernoulli_lpmf(Y | mu);
  // priors including constants
  target += normal_lpdf(b_eta | 0.0, 2.0);
  target += normal_lpdf(sd_1 | 0.0, 1.0)
    - 1 * normal_lccdf(0.0 | 0.0, 1.0);
  target += normal_lpdf(sd_2 | 0.0, 3.0)
    - 1 * normal_lccdf(0.0 | 0.0, 3.0);
  target += std_normal_lpdf(z_1);
  target += std_normal_lpdf(z_2);
}
generated quantities {
  // marginal loo für items
  vector[N_2] loglik_m;
  // fit statistics
  row_vector[N_2] itemfit;
  row_vector[N_2] infit;
  row_vector[N_2] outfit;

  {
    matrix[N_1, N_2] expectedY = .25 + .75 * inv_logit(rep_matrix(b_eta + r_1_eta_1, N_2) + rep_matrix(to_row_vector(r_2_eta_1), N_1));
    matrix[N_1, N_2] VarY = expectedY .* (1.0 - expectedY);
    matrix[N_1, N_2] residual_sq = square(Y_wide_mat - expectedY) ./ VarY;
    itemfit = onevec_N_1 * residual_sq;
    infit = itemfit / N_1;
    outfit = onevec_N_1 * (residual_sq .* VarY) ./ (onevec_N_1 * VarY);
    
    for (k in 1:N_2) {
      loglik_m[k] = integrate_1d(
        irt_marg_lik,
        negative_infinity(),
        positive_infinity(),
        append_array({ b_eta, sd_2 }, to_array_1d(r_1_eta_1)),
        { 0.0 },
        integration_data[k],
        sqrt(machine_precision())
      );
    }
    
    loglik_m = log(loglik_m);
  }
}
