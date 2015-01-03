﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.IO;

namespace cds.Controllers
{
    public class ResInfoController : ApiController
    {
        //private string _basePath = "E:/dev/websites/aspx/cds-porteFolio-DannyThibaudeau/cds/Files";

        public IDictionary<string, object> Get(string item, string platform)
        {
            var filesList = new List<object>();
            var ret = new Dictionary<string, object>();

            var entries = GetEntriesForItemAndPlatform(item, platform);

            foreach (var entry in entries)
            {
                var obj = BuildObjectFromEntry(entry);
                filesList.Add(obj);
            }

            ret.Add("files", filesList);

            return ret;
        }

        private IList<string> GetEntriesForItemAndPlatform(string item, string platform)
        {
            var entries = new List<string>();
            var path = BasePath + "/" + item + "/" + platform;

            var folders = Directory.EnumerateDirectories(path);
            foreach (var folder in folders)
            {
                FileInfo fi = new FileInfo(folder);

                entries.Add(item + "/" + platform + "/" + fi.Name);
            }

            return entries;
        }

        private object BuildObjectFromEntry(string entry)
        {
            var res = new Dictionary<string, object>();
            var path = BasePath + "/" + entry;

            var description = File.ReadAllLines(path + "/desc.txt");
            var version = File.ReadAllLines(path + "/version.txt");
            var files = Directory.EnumerateFiles(path + "/file");

            res.Add("description", description);
            res.Add("version", version.First());

            var fi = new FileInfo(files.First());

            res.Add("file", entry + "/" + fi.Name);

            return res;
        }

        private string BasePath
        {
            get
            {
                return System.Configuration.ConfigurationManager.AppSettings["fileBasePath"];
            }
        }
    }
}
