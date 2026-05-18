//
//  mal_webp_parser.hpp
//  Demo
//
//  Created by wangyaqiang on 2024/11/11.
//

#ifndef mal_jpg_parser_hpp
#define mal_jpg_parser_hpp

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
    class JPGParser : public IParser {
        public:
        JPGParser(const std::shared_ptr<IDataSource>& datasource);
        JPGParser(const std::string& path, Type type);
        int startParse();
        bool supportFormat();
        private:
        int _parseAtom();
        int _parseChildAtom(std::shared_ptr<MALAtom> parent, bool once = false);
        void parseMarker(std::shared_ptr<MALAtom> parent, std::shared_ptr<MALAtom> atom);
        std::shared_ptr<MALAtom> preAtom = nullptr;
        std::vector<std::tuple<int,int,int,std::string>> markes; //marker start ,marker end,len,name
        int64_t nextMarker(std::shared_ptr<MALAtom> parent);
    };
}

#endif /* mal_webp_parser_hpp */
