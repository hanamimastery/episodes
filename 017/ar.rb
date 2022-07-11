User
  .joins('left outer join tasks on tasks.user_id = users.user_id')
  .where(tasks: { id: nil })
