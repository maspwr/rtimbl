%module rtimbl

%{
#include "TimblAPI.h"
using namespace Timbl;  
%}

%rename("to_string_weighting") to_string( const Weighting );
%rename("to_string_algorithm") to_string( const Algorithm );
%include std_string.i
%include std_vector.i

namespace Timbl{
  
  enum Algorithm { UNKNOWN_ALG, IB1, IB2, IGTREE, TRIBL, TRIBL2, LOO, CV };
  enum Weighting { UNKNOWN_W, UD, NW, GR, IG, X2, SV };

  class ValueClass {
  public:
    ValueClass( const std::string& n, unsigned int i ):
      name( n ), index( i ), Frequency( 1 ) {};
    virtual ~ValueClass() {};
    unsigned int Index() const { return index; };
    const std::string& Name() const { return name; };
  protected:
    const std::string& name;
    unsigned int index;
  };

  class TargetValue: public ValueClass {
  public:
    TargetValue( const std::string&, unsigned int );
  };

  class TimblAPI {
  public:
    TimblAPI( const std::string&,  const std::string& = "" );
    TimblAPI( const TimblAPI& );
    ~TimblAPI();
    bool Valid() const;
    bool StartServer( const int, const int=10 );
    bool Prepare( const std::string& = "" );
    bool Learn( const std::string& = "" );
    bool Increment( const std::string& );
    bool Decrement( const std::string& );
    bool Expand( const std::string& );
    bool Remove( const std::string& );
    bool Test( const std::string& = "", 
	       const std::string& = "",
	       const std::string& = "" );
    bool NS_Test( const std::string& = "", 
		  const std::string& = "" );
    const TargetValue *Classify( const std::string& );
    const TargetValue *Classify( const std::string&, double& );
    bool Classify( const std::string&, std::string& );
    bool Classify( const std::string&, std::string&, double& );
    bool Classify( const std::string&, std::string&, 
		   std::string&, double& );
    bool SaveWeights( const std::string& = "" );
    bool GetWeights( const std::string& = "", Weighting = UNKNOWN_W  );
    Weighting CurrentWeighting() const;
    Weighting GetCurrentWeights( std::vector<double>& ) const;
    bool WriteInstanceBase( const std::string& = "" );
    bool WriteInstanceBaseXml( const std::string& = "" );
    bool WriteInstanceBaseLevels( const std::string& = "", unsigned int=0 );
    bool GetInstanceBase( const std::string& = "" );
    bool WriteArrays( const std::string& = "" );
    bool GetArrays( const std::string& = "" );
    bool WriteNamesFile( const std::string& = "" );
    bool ShowWeights( std::ostream& ) const;
    bool ShowOptions( std::ostream& ) const;
    bool ShowSettings( std::ostream& ) const;
    bool ShowStatistics( std::ostream& ) const;
    bool SetOptions( const std::string& );
    bool Set_Single_Threaded();
    Algorithm Algo() const;
    static int Default_Max_Feats();
    bool initExperiment();
  }; 
  
  const std::string to_string( const Algorithm );
  const std::string to_string( const Weighting );
  bool string_to( const std::string&, Algorithm& );
  bool string_to( const std::string&, Weighting& );
  
}

