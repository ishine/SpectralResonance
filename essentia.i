%module "essentia"
%{
#include "essentia.h"
#include "parameter.h"
#include "configurable.h"
#include "connector.h"
#include "range.h"
#include "algorithm.h"

using namespace essentia;
using namespace essentia::standard;
%}

%include "parameter.i"
%include "configurable.i"
%include "connector.i"
%include "range.i"
%include "algorithm.i"

/*
%include "connector.h"
%include "pool.h"
%include "range.h"
%include "algorithm.h"
%include "algorithmfactory.h"
*/