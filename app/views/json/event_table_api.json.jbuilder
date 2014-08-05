json.Events @event_info do |event|
	json.EventId event.id
	json.EventTitle event.title
	json.CategoryId event.categoryid
	json.PlaceId event.placeid
	json.SubPlace event.subplace
end
json.Updates @update do |update|
	
end