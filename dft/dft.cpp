
#include "dft/dft.hpp"
#include "dft/nwpw/nwpw.hpp"

using std::cout;

int dftlib(){
  cout << "hello dft world\n";
  int harry = nwpwlib();
  cout << "harry=" << harry << "\n";

  return 0;
}
