json.Description @event_info do |event|
	json.EventId event.id
	json.EventDescription event.description
	json.EventTimeFirstDay event.firstday_time
	json.EventTimeSecondDay event.secondday_time
	json.EventImageUrl "https://#{@host}/uploads/event_info/image_url/#{event.event_id}/#{event.image_url}"
	json.EventMovieUrl event.movie_url
end
json.Updates @revisions do |revision|
	json.Revision revision[0]
	json.New revision[1][:new]
	json.Update revision[1][:update]
	json.Delete revision[1][:delete]
end