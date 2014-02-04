json.array!(@courses) do |course|
  json.extract! course, :id, :name, :workload, :specification, :strat_date, :end_date, :maximun_capacity, :minimun_capacity
  json.url course_url(course, format: :json)
end
