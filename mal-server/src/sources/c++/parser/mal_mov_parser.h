#include "mal_i_parser.h"
#include "mal_atom.h"
#include "../loader/mal_mp4_packet_loader.hpp"
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
    class MP4Parser : public IParser {
        public:
        MP4Parser(const std::shared_ptr<IDataSource>& datasource);
        MP4Parser(const std::string& path, Type type);
        int startParse() override ;
        std::string dumpFormats(int full = 0) override;
        std::string dumpVideoConfig() override;
        bool supportFormat() override;
        ~MP4Parser() {
            std::cout << "MP4Parser dealloc" << std::endl;
        }
        private:
        int _parseAtom();
        int _parseChildAtom(std::shared_ptr<MALAtom> parent, bool once = false);
        void registerParserTableEntry_();
        std::vector<std::tuple<std::string,std::function<void(std::shared_ptr<MALAtom>)>>> _parseTableEntry;
        uint64_t iref_version_;
        cJSON * dumpPS_(mdp_header_item *item);
        std::shared_ptr<MALMP4Stream> currentStream_ = nullptr;
        int pitm_id_ = -1;//heif 主图id
        std::unordered_map<int, std::string> infes_;
        std::unordered_map<int, std::vector<int>> dimg;
        std::unordered_map<int, std::vector<int>> ipma;
    };
}
