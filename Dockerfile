FROM tomcat:8.5

# add authentication credentials to Tomcat for Fcrepo
# remove the closing tag, then use the echo|tee pattern to build it back in
RUN sed -i 's|</tomcat-users>| |' $CATALINA_HOME/conf/tomcat-users.xml
RUN echo "<role rolename=\"fedoraAdmin\" />" | tee -a $CATALINA_HOME/conf/tomcat-users.xml \
    && echo "<user username=\"${FCREPO_ADMIN_USER:-fedoraAdmin}\" password=\"${FCREPO_ADMIN_PASSWORD:-fedoraAdmin}\" roles=\"fedoraAdmin\"/>" | tee -a $CATALINA_HOME/conf/tomcat-users.xml \
    && echo "</tomcat-users>" | tee -a $CATALINA_HOME/conf/tomcat-users.xml
    
# Install Fedora with OAI-Provider
ADD ./fcrepo.war ${CATALINA_HOME}/webapps/fcrepo.war

EXPOSE 8080 51516 51513