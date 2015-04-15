defmodule Clocks.PageController do
  use Clocks.Web, :controller

  plug :action

  def index(conn, _params) do
    tzs = ["ACT", "ADT", "AFT", "AKDT", "AKST", "AMST", "AMST", "AMT", "AMT",
           "ART", "AST", "AST", "AZOST", "AZT", "BDT", "BOT", "BRT", "BST", "BST",
           "BTT", "CAT", "CCT", "CDT", "CEST", "CET", "CHADT", "CHAST", "CHOT",
           "ChST", "CHUT", "CKT", "CLST", "CLT", "COT", "CST", "CST", "CST",
           "CST", "CVT", "CWST", "CXT", "DAVT", "DDUT", "EASST", "EAST", "EAT",
           "ECT", "ECT", "EDT", "EEST", "EET", "EGST", "EGT", "EST", "FET",
           "FJT", "FKST", "FKST", "FNT", "GALT", "GAMT", "GET", "GFT", "GILT",
           "GMT", "GST", "GST", "GYT", "HADT", "HAST", "HKT", "HOVT", "HST",
           "ICT", "IDT", "IOT", "IRDT", "IRKT", "IRST", "IST", "IST", "IST",
           "JST", "KGT", "KOST", "KRAT", "KST", "LHST", "LHST", "LINT", "MAGT",
           "MART", "MAWT", "MDT", "MET", "MEST", "MHT", "MIST", "MMT", "MSK",
           "MST", "MST", "MST", "MUT", "MVT", "MYT", "NCT", "NDT", "NFT", "NPT",
           "NST", "NUT", "NZDT", "NZST", "OMST", "ORAT", "PDT", "PET", "PETT", "PGT",
           "PHOT", "PKT", "PMDT", "PMST", "PONT", "PST", "PST", "PYST", "PYT", "RET",
           "ROTT", "SAKT", "SAMT", "SAST", "SBT", "SCT", "SGT", "SRT", "SST", "SST",
           "SYOT", "TAHT", "TFT", "TJT", "TKT", "TLT", "TMT", "TOT", "TVT", "UCT",
           "ULAT", "UTC", "UYST", "UYT", "UZT", "VET", "VLAT", "VOLT", "VOST",
           "VUT", "WAKT", "WAST", "WAT", "WEST", "WET", "WIT", "WST", "YAKT", "YEKT", "Z"]

    render conn, "index.html", tzs: tzs
  end
  
end
