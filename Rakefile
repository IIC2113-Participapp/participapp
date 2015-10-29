# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'metric_fu'


MetricFu.configuration.configure_metrics.each do |metric|
  if [:cane, :churn, :flay, :flog, :rcov,
     :reek, :roodi, :rails_best_practices, :code_metrics].include?(metric.name)
    metric.enabled = true
  else
    metric.enabled = false
  end
end

Rails.application.load_tasks
