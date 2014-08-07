json.Events @event_info do |event|
	json.EventId event.id
	json.EventTitle event.title
	json.CategoryId event.categoryid
	json.PlaceId event.placeid
	json.SubPlace event.subplace
end
json.Updates @revisions do |revision|
	json.Revision revision[0]
	json.New revision[1][:new]
	json.Update revision[1][:update]
	json.Delete revision[1][:delete]
end