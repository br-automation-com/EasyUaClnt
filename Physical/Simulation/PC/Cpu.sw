﻿<?xml version="1.0" encoding="utf-8"?>
<?AutomationStudio FileVersion="4.9"?>
<SwConfiguration CpuAddress="" xmlns="http://br-automation.co.at/AS/SwConfiguration">
  <TaskClass Name="Cyclic#1" />
  <TaskClass Name="Cyclic#2" />
  <TaskClass Name="Cyclic#3" />
  <TaskClass Name="Cyclic#4" />
  <TaskClass Name="Cyclic#5" />
  <TaskClass Name="Cyclic#6" />
  <TaskClass Name="Cyclic#7" />
  <TaskClass Name="Cyclic#8">
    <Task Name="ServerTask" Source="EasyUaCltSamples.ServerTask.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Read" Source="EasyUaCltSamples.Read.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ReadList" Source="EasyUaCltSamples.ReadList.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ReadBulk" Source="EasyUaCltSamples.ReadBulk.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Write" Source="EasyUaCltSamples.Write.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="WriteList" Source="EasyUaCltSamples.WriteList.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="WriteBulk" Source="EasyUaCltSamples.WriteBulk.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="Subs" Source="EasyUaCltSamples.Subs.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="SubsList" Source="EasyUaCltSamples.SubsList.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="MethodCall" Source="EasyUaCltSamples.MethodCall.prg" Memory="UserROM" Language="IEC" Debugging="true" />
    <Task Name="ConGetStat" Source="EasyUaCltSamples.ConGetStat.prg" Memory="UserROM" Language="IEC" Debugging="true" />
  </TaskClass>
  <Binaries>
    <BinaryObject Name="udbdef" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="TCData" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="FWRules" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="iomap" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwac" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="sysconf" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="arconfig" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="asfw" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="BRRole" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="ashwd" Source="" Memory="SystemROM" Language="Binary" />
    <BinaryObject Name="UaCsConfig" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="User" Source="" Memory="UserROM" Language="Binary" />
    <BinaryObject Name="Role" Source="" Memory="UserROM" Language="Binary" />
  </Binaries>
  <Libraries>
    <LibraryObject Name="runtime" Source="Libraries.runtime.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="operator" Source="Libraries.operator.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsIecCon" Source="Libraries.AsIecCon.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="astime" Source="Libraries.astime.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsBrStr" Source="Libraries.AsBrStr.lby" Memory="UserROM" Language="binary" Debugging="true" />
    <LibraryObject Name="AsOpcUas" Source="Libraries.AsOpcUas.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="AsOpcUac" Source="Libraries.AsOpcUac.lby" Memory="UserROM" Language="Binary" Debugging="true" />
    <LibraryObject Name="EasyUaClnt" Source="Libraries.EasyUaClnt.lby" Memory="UserROM" Language="IEC" Debugging="true" />
    <LibraryObject Name="sys_lib" Source="Libraries.sys_lib.lby" Memory="UserROM" Language="Binary" Debugging="true" />
  </Libraries>
</SwConfiguration>