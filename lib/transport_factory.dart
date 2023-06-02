enum TransportType{ WaterTransport, AutoTransport, AirTransport, RailwayTransport }

abstract class Transport{
  final String companyName;
  final int maxWeight;
  final int maxHeight;

  Transport({required this.maxWeight, required this.maxHeight,
  required this.companyName});

  factory Transport.factory(TransportType transportType){
    switch (transportType){
      case TransportType.AirTransport:
        return AirTransport(10, 15, 'airPlay' );
      case TransportType.AutoTransport:
        return AutoTransport(11, 15, 'autoPlay' );
      case TransportType.RailwayTransport:
        return RailwayTransport(12, 15, 'railwayPlay', 5, true );
      case TransportType.WaterTransport:
        return WaterTransport(13, 15, 'waterPlay');
    }
  }


    String countryToDelieve();

    @override
  String toString(){
      return 'Transport from company $companyName delieve product with max Height $maxHeight and max Weight $maxWeight';
    }
}

class WaterTransport extends Transport{
  final List<String> WaterTransportType = ['Sea', 'River'];

  WaterTransport(int maxWeight, int maxHeight, String companyName):
  super(maxHeight: maxHeight, maxWeight: maxWeight, companyName: companyName);

  @override
  String countryToDelieve() {
    return 'USA';
  }
}

class RailwayTransport extends Transport{
  final bool isWithBallast;
  final int size;

  RailwayTransport(int maxWeight, int maxHeight, String companyName, this.size, this.isWithBallast):
        super(maxHeight: maxHeight, maxWeight: maxWeight, companyName: companyName);

  @override
  String countryToDelieve() {
    return 'China';
  }
}

class AirTransport extends Transport{
  final List<String> AirTransportType = ['inTown', 'interCity', 'international' ];
  final List<String> AirTransportValue = [ 'passenger', 'truck'];

  AirTransport(int maxWeight, int maxHeight, String companyName):
        super(maxHeight: maxHeight, maxWeight: maxWeight, companyName: companyName);

  @override
  String countryToDelieve() {
    return 'Germany';
  }
}

class AutoTransport extends Transport{

  AutoTransport(int maxWeight, int maxHeight, String companyName):
        super(maxHeight: maxHeight, maxWeight: maxWeight, companyName: companyName);

  @override
  String countryToDelieve() {
    return 'Belarus';
  }
}

void main() {
  for(var value in TransportType.values){
    var transport = Transport.factory(value);
    print(transport.toString() + ' to ' + transport.countryToDelieve() + ' country to delieve');
  }
}