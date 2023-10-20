*&---------------------------------------------------------------------*
*& Report z04_main_planes
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z04_main.

**********************************************************************
* Planes deklarieren *
**********************************************************************
DATA passanger TYPE REF TO zcl_04_airplane.
DATA cargo TYPE REF TO zcl_04_airplane.
DATA cargo2 TYPE REF TO zcl_04_airplane.
DATA cargo3 TYPE REF TO zcl_04_airplane.

**********************************************************************
* Vehicles deklarieren *
**********************************************************************
DATA auto TYPE REF TO zcl_04_vehicle.
DATA truck TYPE REF TO zcl_04_vehicle.

**********************************************************************
* Verteiler deklarieren *
**********************************************************************
DATA rental TYPE REF TO zcl_04_rental.
DATA carrier TYPE REF TO zcl_04_carrier.

**********************************************************************
* Agency deklarieren *
**********************************************************************
DATA agency TYPE REF TO zcl_04_agency.

**********************************************************************
* Planes anlegen *
**********************************************************************
passanger = NEW zcl_04_passanger( name_i = 'Airbus' type_i = 'Gooffa' number_of_seats = 69 ).
cargo = NEW zcl_04_cargo( name_i = 'Choncc' type_i = 'BigAhh' cargo_in_tons = 1337 ).
cargo2 = NEW zcl_04_cargo( name_i = 'Bruh' type_i = 'Bameninghong' cargo_in_tons = 4000 ).
cargo3 = NEW zcl_04_cargo( name_i = 'Idk' type_i = 'Fckyou' cargo_in_tons = 250 ).

**********************************************************************
* Vehicles anlegen  *
**********************************************************************
auto = NEW zcl_04_car( make_i = 'VW' model_i = 'Gooffa' number_of_seats = 1000 ).
truck = NEW zcl_04_truck( make_i = 'Tesla' model_i = 'Cybertruck' cargo_in_tons = 30 ).

**********************************************************************
* Verteiler anlegen *
**********************************************************************
rental = NEW zcl_04_rental( name = 'GoofyRental' ).
carrier = NEW zcl_04_carrier( name = 'Bababooey' ).

**********************************************************************
* Agency anlegen *
**********************************************************************
agency = NEW zcl_04_agency( name = 'GoofyAhhAgency GmbH' ).

**********************************************************************
* Partner einfügen*
**********************************************************************
agency->add_partner( partner = rental ).
agency->add_partner( partner = carrier ).

**********************************************************************
* Vehicles und Planes einfügen *
**********************************************************************
"Planes into Carrier
carrier->add_airplane( airplane =  passanger ).
carrier->add_airplane( airplane = cargo ).
carrier->add_airplane( airplane = cargo2 ).
carrier->add_airplane( airplane = cargo3 ).

"Vehicles into Rental
rental->add_vehicle( vehicle = auto ).
rental->add_vehicle( vehicle = truck ).


**********************************************************************
* Ausgabe *
**********************************************************************
" Planes
WRITE / |Anzahl an Flugzeugen: { zcl_04_airplane=>get_number( ) }|.
WRITE / cargo->to_string( ).
WRITE / passanger->to_string( ).
WRITE / |Flugzeuge im Carrier: { carrier->zif_04_partner~to_string( ) }|.
WRITE / |Biggest Aal: { carrier->get_biggest_cargo_plane( )->to_string( ) }|.

" Trenner
WRITE / '****************************************'.

" Vehicles
write / |Anzahl an Fahrzeugen: { zcl_04_vehicle=>number_of_vehicles }| .
WRITE / auto->to_string( ).
WRITE / truck->to_string( ).
WRITE / |Fahrzeuge beim Rental Aal: { rental->zif_04_partner~to_string( ) }|.

" Agency
WRITE / |Partner der Agency: { agency->to_string( ) }|.
