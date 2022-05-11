%{
#include "essentia.h"
#include "algorithm.h"
#include "algorithmfactory."
}


namespace essentia::standard
{
    class Algorithm : public Configurable {
    public:

    const InputMap& inputs() const;
    const OutputMap& outputs() const;

    InputBase& input(const std::string& name);
    OutputBase& output(const std::string& name);
    std::vector<std::string> inputNames();
    std::vector<std::string> outputNames();
    virtual void compute() = 0;
    virtual void reset();
    std::vector<const std::type_info*> inputTypes() const;
    std::vector<const std::type_info*> outputTypes() const;
    };
} // namespace essentia


namespace essentia {

    template <typename BaseAlgorithm>
    class AlgorithmInfo {
    public:
    
        typedef BaseAlgorithm* (*AlgorithmCreator)();
        AlgorithmCreator create;
        std::string name; // do we need this one or is it redundant
        std::string description;
        std::string category;
    };


    template <typename BaseAlgorithm>
    class EssentiaFactory {
    public:

        static void init();
        static void shutdown();
        static BaseAlgorithm* create(const std::string& id);
        static void free(BaseAlgorithm* algo);
        static std::vector<std::string> keys();
        static const AlgorithmInfo<BaseAlgorithm>& getInfo(const std::string& id);   
        static EssentiaFactory& instance();

        protected:
        // protected constructor to ensure singleton.
        EssentiaFactory() {}
        EssentiaFactory(EssentiaFactory&);

        //typedef EssentiaMap<std::string, AlgorithmInfo<BaseAlgorithm>, string_cmp> CreatorMap;
        //CreatorMap _map;
        // it goes to 25 of these...
        //static BaseAlgorithm* create(const std::string & id1, const Parameter& value value1);
        //BaseAlgorithm* create_i(const std::string& id1);

        template <typename ConcreteProduct, typename ReferenceConcreteProduct = ConcreteProduct> class Registrar;
    };

    template <typename ConcreteProduct, typename ReferenceConcreteProduct = ConcreteProduct>
    class EssentiaFactory::Registrar {
    public:
        Registrar();
        static BaseAlgorithm* create();
    };
} // namespace essentia