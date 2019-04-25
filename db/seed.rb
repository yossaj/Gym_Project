require_relative( '../models/classes' )
require_relative( '../models/members' )
require_relative( '../models/bookings' )


Booking.delete_all
FitClass.delete_all
Member.delete_all

class1 = FitClass.new({'type'=>'Tabata', 'time'=> '12:40'})
class1.save

member1 = Member.new({'name'=>'Billy', 'membership_type'=> 'Standard', 'reg_date'=>'11-08-2009'} )
member1.save()

booking1 = Booking.new({'class_id'=>class1.id, 'member_id'=> member1.id})
booking1.save

class1.type = 'salsa'
class1.update()

member1.name = 'Jim'
member1.update

p member1
