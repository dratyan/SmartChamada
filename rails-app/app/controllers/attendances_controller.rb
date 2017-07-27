class AttendancesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def register
    course_id = params['course_id']
    cartao = params['cartao']
    secret = params['secret']

    course = Course.find_by(id: course_id)
    roll_call = RollCall.find_by(secret: secret)

    if course && roll_call
      attendance = Attendance.create(roll_call: roll_call,
                                     cartao: cartao)
      if attendance
        render json: { registered: true }
        return nil
      end
    end

    render json: { registered: false }
  end

  private
    def attendance_params
      params.require(:attendance).permit(:course_id, :secret, :cartao, :lat, :lon)
    end
end
