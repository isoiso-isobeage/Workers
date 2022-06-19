json.array!(@works) do |work|
    json.id work.id
    json.title work.name
    json.start work.start_date
    json.end work.end_date
    json.site_id work.site_id
    json.url site_work_path(work.site_id, work.id)
   end