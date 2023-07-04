namespace UI5conDemo;

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Airport
{
    key IATACode : String(3);
    Name : String(100) not null;
    City : String(100);
    Country : String(100);
    Timezone : String(100)
        @Common.IsTimezone;
    toOpeningHours : Composition of many OpeningHours on toOpeningHours.toAirport = $self;
}

entity OpeningHours
{
    key ID : UUID
        @Core.Computed;
    Days : String(100);
    Opening : Time;
    Closing : Time;
    toAirport : Association to one Airport;
}

@odata.draft.enabled
entity Flights
{
    key ID : UUID
        @Core.Computed;
    FlightID : String(10)
        @Common.Label : 'Flight ID';
    Departure : Timestamp
        @Common.Label : 'Departure'
        @Common.Timezone : toDepartureAirport.Timezone;
    Arrival : Timestamp
        @Common.Label : 'Arrival'
        @Common.Timezone : toArrivalAirport.Timezone;
    CreatedAt : Timestamp default $now
        @Common.Label : 'Created At';
    toPilot : Association to one Pilot
        @Common.Label : 'Pilot';
    toDepartureAirport : Association to one Airport;
    toArrivalAirport : Association to one Airport;
}

entity Pilot
{
    key ID : String(20);
    FirstName : String(100);
    LastName : String(100);
    Birthday : Date;
}
