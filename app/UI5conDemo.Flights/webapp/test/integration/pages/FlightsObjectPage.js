sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'UI5conDemo.Flights',
            componentId: 'FlightsObjectPage',
            entitySet: 'Flights'
        },
        CustomPageDefinitions
    );
});