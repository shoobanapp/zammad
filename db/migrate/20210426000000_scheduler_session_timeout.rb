class SchedulerSessionTimeout < ActiveRecord::Migration[5.2]
  def change

    return if !Setting.exists?(name: 'system_init_done')

    Scheduler.find_by(name: 'Cleanup dead sessions.').update(period: 1.hour)
  end
end
