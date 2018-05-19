unless(Rsvp.EventQueries.any) do
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2018-05-23 09:00:00", title: "Summer Codefest", location: "Manila, PH"}))
  Rsvp.EventQueries.create(Rsvp.Events.changeset(%Rsvp.Events{}, %{date: "2018-06-15 00:00:00", title: "Sweldo", location: "Eastwood City, PH"}))
end
