importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.4.1/firebase-messaging.js');

   /*Update with yours config*/
  const firebaseConfig = {
  apiKey: "AIzaSyAPaePPsnCQ_I2MKODe4ofybO_0briJ0X8",
              authDomain: "beyondconsulting-ebbe5.firebaseapp.com",
              projectId: "beyondconsulting-ebbe5",
              storageBucket: "beyondconsulting-ebbe5.appspot.com",
              messagingSenderId: "1009527882445",
              appId: "1:1009527882445:web:54cbedfa27b82b26825f84",
              measurementId: "G-XWNLTMCH8E"
 };
  firebase.initializeApp(firebaseConfig);
  const messaging = firebase.messaging();

  /*messaging.onMessage((payload) => {
  console.log('Message received. ', payload);*/
  messaging.onBackgroundMessage(function(payload) {
    console.log('Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
      body: payload.notification.body,
    };

    self.registration.showNotification(notificationTitle,
      notificationOptions);
  });