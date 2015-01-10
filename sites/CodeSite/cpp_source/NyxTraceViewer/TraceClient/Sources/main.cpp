//#include "mainwindow.h"

#include <Nyx.hpp>
#include <NyxNet.hpp>
#include <NyxNetTcpIpTraceOutput.hpp>
#include <NyxWebSvr/Module.hpp>
#include <NyxConsoleTraceOutput.hpp>

#include "TraceClientCoreModule.hpp"
#include "PipeTraceFeeder.hpp"
#include "TraceClientApp.h"

#include "StatusUpdaters/UISensorsFactory.hpp"

#include <NyxLocalTime.hpp>

#include <QApplication>
#include <QDir>

#include "NyxTaskExecuterPool.hpp"










#define NYXTRACE(filter, output)    { Nyx::CTraceStream stream(filter); stream << output; }



Nyx::CTraceStream& operator << ( Nyx::CTraceStream& stream, const Nyx::CLocalTime& ltime )
{
    stream << ltime.Hours() << L":" << ltime.Minutes() << L":" << ltime.Seconds();
    return stream;
}




int main(int argc, char *argv[])
{
    Nyx::CModuleRef                             refModule = Nyx::CModule::Alloc();
    NyxNet::CModuleRef                          refNetModule = NyxNet::CModule::Alloc();
    NyxWebSvr::CModuleRef                       refWebSvrModule = NyxWebSvr::CModule::Alloc();


#if defined(_DEBUG)
    Nyx::CTraceCompositorRef                    refTraceCompositor = Nyx::CTraceCompositor::Alloc();

    refTraceCompositor->SetOutput(Nyx::CConsoleTraceOutput::Alloc());
//    refTraceCompositor->SetOutput(NyxNet::CTcpIpTraceOutput::Alloc("NyxTraceViewer", "127.0.0.1", 8500, true));
//    refTraceCompositor->SetOutput( NyxNet::CPipeTraceOutput::Alloc("TraceViewer"));
#endif

    QDir currentFolder = QDir::current();

    //
    // PATCH for the application to build under Linux
    //
    Nyx::CTaskExecuterPool::Alloc();

    Nyx::CLocalTime     ltime = Nyx::CLocalTime::Get();

    NYXTRACE(0x0, L"current time is : " << ltime << L":");

//    Nyx::CTraceStream(0x0) << ltime.Hours() << L":"
//                           << ltime.Minutes() << L":"
//                           << ltime.Seconds();

    TraceClientCore::CModule                    TraceClientCoreModule;

    Nyx::CTraceStream(0x0).Write(L"Application starting");

    CTraceClientApp     TheApp;

    TheApp.Init(argc, argv);
    TheApp.Run();
    TheApp.Destroy();

    CUISensorsFactory::Terminate();

    TraceClientCoreModule.TracesPools().Clear();

    Nyx::CTraceStream(0x0).Write(L"Application ending");

    return TheApp.ReturnValue();
}

