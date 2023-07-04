sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'UI5conDemo/Flights/test/integration/FirstJourney',
		'UI5conDemo/Flights/test/integration/pages/FlightsList',
		'UI5conDemo/Flights/test/integration/pages/FlightsObjectPage'
    ],
    function(JourneyRunner, opaJourney, FlightsList, FlightsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('UI5conDemo/Flights') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheFlightsList: FlightsList,
					onTheFlightsObjectPage: FlightsObjectPage
                }
            },
            opaJourney.run
        );
    }
);