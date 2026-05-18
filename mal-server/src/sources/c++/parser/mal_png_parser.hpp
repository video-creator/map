//
//  mal_webp_parser.hpp
//  Demo
//
//  Created by wangyaqiang on 2024/11/11.
//

#ifndef mal_png_parser_hpp
#define mal_png_parser_hpp

#include <stdio.h>
#include "mal_i_parser.h"
#include "mal_atom.h"
#include <tuple>
#include <functional>
#include <future>
extern "C" {
    #include "../../utils/mdp_error.h"
    #include "../../utils/thpool.h"
    #include "libavutil/mem.h"
    #include "../../utils/cJSON.h"
}
namespace mal {
    class MALPNGParser : public IParser {
        public:
        explicit MALPNGParser(const std::shared_ptr<IDataSource>& datasource) ;
        MALPNGParser(const std::string& path, Type type);
        int startParse();
        bool supportFormat();
        private:
        int _parseChunk(std::shared_ptr<MALAtom> parent);
        
    };
}

#endif /* mal_png_parser_hpp */
