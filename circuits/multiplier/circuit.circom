pragma circom 2.0.0;

//This circuit template checks that c is the multiplication of a and b./  

template Multiplier2 () {  
   signal input a;
   signal input b;
   signal x;
   signal y;
   signal output q;

   component and_gate=AND();
   component or_gate=OR();
   component not_gate=NOT();

   and_gate.a <== a;
   and_gate.b <== b;
   x <== and_gate.out ;

   not_gate.in <== b ;
   y <== not_gate.out;

   or_gate.a <== x;
   or_gate.b <== y;
   q <== or_gate.out;

}

template AND() {
    signal input a;
    signal input b;
    signal output out;

    out <== a*b;
}

template OR() {
    signal input a;
    signal input b;
    signal output out;

    out <== a + b - a*b;
}

template NOT() {
    signal input in;
    signal output out;

    out <== 1 + in - 2*in;
}

component main = Multiplier2();