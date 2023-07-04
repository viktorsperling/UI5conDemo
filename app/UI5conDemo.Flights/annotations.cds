using UI5conDemoService as service from '../../srv/service';

annotate service.Flights with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Flight ID',
            Value : FlightID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Departure',
            Value : Departure,
        },
        {
            $Type : 'UI.DataField',
            Value : toDepartureAirport.IATACode,
            Label : 'Departure Airport',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Arrival',
            Value : Arrival,
        },
        {
            $Type : 'UI.DataField',
            Value : toArrivalAirport.IATACode,
            Label : 'Target Airport',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Created At',
            Value : CreatedAt,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Pilot',
            Value : toPilot_ID,
        },
    ]
);
annotate service.Flights with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Flight ID',
                Value : FlightID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CreatedAt',
                Value : CreatedAt,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'From',
            ID : 'From',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Departure',
                    ID : 'Departure',
                    Target : '@UI.FieldGroup#Departure',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Departure Airport Info',
                    ID : 'DepartureAirportInfo',
                    Target : '@UI.FieldGroup#DepartureAirportInfo',
                },{
                    ID: 'DepartureOpening',
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Opening Hours',
                    Target: 'toDepartureAirport/toOpeningHours/@UI.LineItem'
                }
                ],
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'To',
            ID : 'To',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Arrival',
                    ID : 'Arrival',
                    Target : '@UI.FieldGroup#To',
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Target Airport Info',
                    ID : 'TargetAirportInfo',
                    Target : '@UI.FieldGroup#TargetAirportInfo',
                },{
                    ID: 'ArrivalOpening',
                    $Type : 'UI.ReferenceFacet',
                    Label: 'Opening Hours',
                    Target: 'toArrivalAirport/toOpeningHours/@UI.LineItem'
                }],
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Pilot',
            ID : 'Pilot',
            Target : '@UI.FieldGroup#Pilot',
        },
    ]
);
annotate service.Flights with {
    CreatedAt @Common.FieldControl : #ReadOnly
};
annotate service.Flights with @(
    UI.FieldGroup #Airport : {
        $Type : 'UI.FieldGroupType',
        Data : [],
    }
);

annotate service.Airport with {
    Country @Common.FieldControl : #ReadOnly
};
annotate service.Airport with {
    Name @Common.FieldControl : #ReadOnly
};
annotate service.Airport with {
    City @Common.FieldControl : #ReadOnly
};
annotate service.Flights with @(
    UI.HeaderInfo : {
        TypeName : 'Flight Details',
        TypeNamePlural : '',
    }
);

annotate service.Flights with {
    toDepartureAirport @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Airport',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : toDepartureAirport_IATACode,
                    ValueListProperty : 'IATACode',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Name',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'City',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Country',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Timezone',
                },
            ],
            Label : 'Departure Airport',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Flights with {
    toArrivalAirport @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Airport',
            Parameters : [
                    {
                        $Type : 'Common.ValueListParameterInOut',
                        LocalDataProperty : toArrivalAirport_IATACode,
                        ValueListProperty : 'IATACode',
                    },
                    {
                        $Type : 'Common.ValueListParameterOut',
                        ValueListProperty : 'Name',
                        LocalDataProperty : toArrivalAirport.Name,
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'City',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Country',
                    },
                    {
                        $Type : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty : 'Timezone',
                    },
                ],
            Label : 'Target Airport',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Flights @(
    Common.SideEffects #UpdateArrivalAriport : {
        SourceProperties : [
            toArrivalAirport_IATACode
        ],
        TargetEntities: [
            toArrivalAirport,
            toArrivalAirport.toOpeningHours
        ]
    },
    Common.SideEffects #UpdateDepartureAriport : {
        SourceProperties : [
            toDepartureAirport_IATACode
        ],
        TargetEntities: [
            toDepartureAirport,
            toDepartureAirport.toOpeningHours
        ]
    },
    Common.SideEffects #UpdatePilot : {
        SourceProperties : [
            toPilot_ID
        ],
        TargetEntities: [
            toPilot
        ]
    }
);

annotate service.Flights with @(
    UI.FieldGroup #Pilot : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : toPilot_ID,
            },{
                $Type : 'UI.DataField',
                Value : toPilot.FirstName,
                Label : 'Firstname',
            },{
                $Type : 'UI.DataField',
                Value : toPilot.LastName,
                Label : 'Lastname',
            },{
                $Type : 'UI.DataField',
                Value : toPilot.Birthday,
                Label : 'Birthday',
            },],
    }
);
annotate service.Flights with {
    toPilot @(Common.ValueList : {
            $Type : 'Common.ValueListType',
            CollectionPath : 'Pilot',
            Parameters : [
                {
                    $Type : 'Common.ValueListParameterInOut',
                    LocalDataProperty : toPilot_ID,
                    ValueListProperty : 'ID',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'FirstName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'LastName',
                },
                {
                    $Type : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty : 'Birthday',
                },
            ],
            Label : 'Pilot',
        },
        Common.ValueListWithFixedValues : false
)};
annotate service.Pilot with {
    FirstName @Common.FieldControl : #ReadOnly
};
annotate service.Pilot with {
    LastName @Common.FieldControl : #ReadOnly
};
annotate service.Flights with @(
    UI.SelectionFields : [
        FlightID,
        Departure,
        toDepartureAirport_IATACode,
        Arrival,
        toArrivalAirport_IATACode,
        toPilot_ID,
    ]
);
annotate service.Airport with {
    IATACode @Common.Text : {
            $value : Name,
            ![@UI.TextArrangement] : #TextFirst,
        }
};

annotate service.Flights with @(
    UI.FieldGroup #Departure : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : toDepartureAirport_IATACode,
            },    {
                $Type : 'UI.DataField',
                Value : Departure,
            },],
    }
);
annotate service.Flights with @(
    UI.FieldGroup #DepartureAirportInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : toDepartureAirport.Name,
                Label : 'Name',
            },    {
                $Type : 'UI.DataField',
                Value : toDepartureAirport.City,
                Label : 'City',
            },    {
                $Type : 'UI.DataField',
                Value : toDepartureAirport.Country,
                Label : 'Country',
            },],
    }
);
annotate service.Flights with @(
    UI.FieldGroup #To : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : toArrivalAirport_IATACode,
            },    {
                $Type : 'UI.DataField',
                Value : Arrival,
            },],
    }
);
annotate service.Flights with @(
    UI.FieldGroup #TargetAirportInfo : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : toArrivalAirport.Name,
                Label : 'Name',
            },    {
                $Type : 'UI.DataField',
                Value : toArrivalAirport.City,
                Label : 'City',
            },    {
                $Type : 'UI.DataField',
                Value : toArrivalAirport.Country,
                Label : 'Country',
            },],
    }
);
annotate service.OpeningHours with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Label : 'Days',
            Value : Days,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Opening',
            Value : Opening,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Closing',
            Value : Closing,
        }
    ]
);
annotate service.Flights with {
    toDepartureAirport @Common.Text : {
        $value : toDepartureAirport.Name,
        ![@UI.TextArrangement] : #TextFirst,
    }
};
annotate service.Flights with {
    toArrivalAirport @Common.Text : toArrivalAirport.Name
};
annotate service.Flights with {
    toDepartureAirport @Common.Label : 'Departure Airport'
};
annotate service.Flights with {
    toArrivalAirport @Common.Label : 'Target Airport'
};
