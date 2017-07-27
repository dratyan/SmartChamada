class AttendancesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def register
    course_id = params['course_id']
    cartao = params['cartao']
    secret = params['secret']

    course = Course.find_by(id: course_id)
    roll_call = RollCall.find_by(course_id: course_id, secret: secret)

    lat_student = params['lat']
    lon_student = params['lon']

    if course && roll_call && lat_student && lon_student

      lat_course, lon_course = course.location.split(',')

      dist = distance([lat_course.to_f,lon_course.to_f], [lat_student.to_f, lon_student.to_f])
      puts "distance: " + dist.to_s
      if dist <= 1000
        attendance = Attendance.new(roll_call: roll_call,
                                       cartao: cartao)
        if attendance.save
          render json: { registered: true }
          return nil
        end
      end
    end

    render json: { registered: false }
  end

  private
    def distance loc1, loc2
      rad_per_deg = Math::PI/180  # PI / 180
      rkm = 6371                  # Earth radius in kilometers
      rm = rkm * 1000             # Radius in meters

      dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
      dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

      lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
      lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

      a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
      c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

      rm * c # Delta in meters
    end

    def attendance_params
      params.require(:attendance).permit(:course_id, :secret, :cartao, :lat, :lon)
    end
end
