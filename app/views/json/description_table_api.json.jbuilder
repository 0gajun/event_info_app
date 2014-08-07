json.Description @event_info do |event|
	json.EventId event.id
	json.EventDescription event.description
	json.EventTimeFirstDay event.firstday_time
	json.EventTimeSecondDay event.secondday_time
	json.EventImageUrl "https://yfes-app-storage-dev.s3.amazonaws.com/uploads/event_info/image_url/#{event.event_id}/#{event.image_url}"
	json.EventMovieUrl event.movie_url
end
json.Updates @updates do |update| 
end