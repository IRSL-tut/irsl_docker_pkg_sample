#!/bin/env python3

import rospy
from std_msgs.msg import String
from irsl_docker_pkg_sample.sample import TEST_FUNCTION

class SUBPUB(object):
    def __init__(self):
        self.pub = rospy.Publisher('strout', String, queue_size=-1)
        self.sub = rospy.Subscriber('strin', String, self.callback, queue_size=-1)

#    def callback_org(self, msg):
#        self.pub.publish(msg)

    def callback(self, msg):
        wstr = TEST_FUNCTION(msg.data)
        self.pub.publish(wstr)

if __name__ == '__main__':
    rospy.init_node('irsl_sample', anonymous=False)

    obj = SUBPUB()

    rospy.spin()
