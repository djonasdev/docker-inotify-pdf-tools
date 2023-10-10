FROM alpine:3.18.4
LABEL Dominic Jonas <info@dominic-jonas.de>

###################################################
# UserId and GroupId                              #
# The ids of the user running the docker          #
# The mounted directory will get this permissions #
###################################################
ENV UID="1036"
ENV GID="1036"

####################
# Custom variables #
####################
ENV TZ="Europe/Berlin"
ENV VOLUMES="/input/"
ENV CMD="pdfseparate #### /output/####-%d.pdf; rm ####"

####################################################
# All installation proccess is in build.sh         #
# It is possible to do all work via RUN command(s) #
# But it looks much better with all work in script #
####################################################
COPY build.sh /tmp/build.sh
RUN chmod u+x /tmp/build.sh

###########################################################################
# Execute our build script and delete it because we won't need it anymore #
###########################################################################
RUN /tmp/build.sh && rm /tmp/build.sh

####################################
# Container initialization scripts #
####################################
COPY docker-run docker-run-root /bin/

######################################
# Set mount point                    #
######################################
VOLUME "/input"
VOLUME "/output"

################################################################################################
# Container will run some preparations with root access (create your user, fixing permissions) #
#   and then execute /bin/docker-run with user access to configure (if needed) and run         #
#		Syncserver                                                                             #
################################################################################################
RUN chmod u+x /bin/docker-run-root
CMD ["/bin/docker-run-root"]
