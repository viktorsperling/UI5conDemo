using { UI5conDemo as my } from '../db/schema';

@path : 'service/UI5conDemo'
service UI5conDemoService
{
    annotate Airport with @restrict :
    [
        { grant : [ '*' ], to : [ 'authenticated-user' ] },
        { grant : [ '*' ], to : [ 'any' ] }
    ];

    annotate Flights with @restrict :
    [
        { grant : [ '*' ], to : [ 'authenticated-user' ] },
        { grant : [ '*' ], to : [ 'any' ] }
    ];

    annotate OpeningHours with @restrict :
    [
        { grant : [ '*' ], to : [ 'authenticated-user' ] },
        { grant : [ '*' ], to : [ 'any' ] }
    ];

    annotate Pilot with @restrict :
    [
        { grant : [ '*' ], to : [ 'authenticated-user' ] },
        { grant : [ '*' ], to : [ 'any' ] }
    ];

    entity Airport as
        projection on my.Airport;

    entity Flights as
        projection on my.Flights;

    entity OpeningHours as
        projection on my.OpeningHours;

    entity Pilot as
        projection on my.Pilot;
}

annotate UI5conDemoService with @requires :
[
    'authenticated-user',
    'any'
];
