unit PdfLib_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 16/07/2008 16:26:51 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\AB\ActiveX\pdf.tlb (1)
// LIBID: {CA8A9783-280D-11CF-A24D-444553540000}
// LCID: 0
// Helpfile: 
// HelpString: Adobe Acrobat Control for ActiveX
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  PdfLibMajorVersion = 6;
  PdfLibMinorVersion = 0;

  LIBID_PdfLib: TGUID = '{CA8A9783-280D-11CF-A24D-444553540000}';

  DIID__DPdf: TGUID = '{CA8A9781-280D-11CF-A24D-444553540000}';
  DIID__DPdfEvents: TGUID = '{CA8A9782-280D-11CF-A24D-444553540000}';
  CLASS_Pdf: TGUID = '{CA8A9780-280D-11CF-A24D-444553540000}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  _DPdf = dispinterface;
  _DPdfEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Pdf = _DPdf;


// *********************************************************************//
// DispIntf:  _DPdf
// Flags:     (4112) Hidden Dispatchable
// GUID:      {CA8A9781-280D-11CF-A24D-444553540000}
// *********************************************************************//
  _DPdf = dispinterface
    ['{CA8A9781-280D-11CF-A24D-444553540000}']
    function LoadFile(const fileName: WideString): WordBool; dispid 2;
    procedure setShowToolbar(On_: WordBool); dispid 3;
    procedure gotoFirstPage; dispid 4;
    procedure gotoLastPage; dispid 5;
    procedure gotoNextPage; dispid 6;
    procedure gotoPreviousPage; dispid 7;
    procedure setCurrentPage(n: Integer); dispid 8;
    procedure goForwardStack; dispid 9;
    procedure goBackwardStack; dispid 10;
    procedure setPageMode(const pageMode: WideString); dispid 11;
    procedure setLayoutMode(const layoutMode: WideString); dispid 12;
    procedure setNamedDest(const namedDest: WideString); dispid 13;
    procedure Print; dispid 14;
    procedure printAllFit(shrinkToFit: WordBool); dispid 24;
    procedure setView(const viewMode: WideString); dispid 18;
    procedure printWithDialog; dispid 15;
    procedure setZoom(percent: Single); dispid 16;
    procedure setViewScroll(const viewMode: WideString; offset: Single); dispid 19;
    procedure setViewRect(left: Single; top: Single; width: Single; height: Single); dispid 20;
    procedure printPages(from: Integer; to_: Integer); dispid 21;
    procedure setZoomScroll(percent: Single; left: Single; top: Single); dispid 17;
    procedure setShowScrollbars(On_: WordBool); dispid 25;
    procedure printPagesFit(from: Integer; to_: Integer; shrinkToFit: WordBool); dispid 22;
    procedure printAll; dispid 23;
    function GetVersions: OleVariant; dispid 26;
    procedure setCurrentHightlight(a: Integer; b: Integer; c: Integer; d: Integer); dispid 27;
    procedure AboutBox; dispid -552;
    property src: WideString dispid 1;
  end;

// *********************************************************************//
// DispIntf:  _DPdfEvents
// Flags:     (4096) Dispatchable
// GUID:      {CA8A9782-280D-11CF-A24D-444553540000}
// *********************************************************************//
  _DPdfEvents = dispinterface
    ['{CA8A9782-280D-11CF-A24D-444553540000}']
  end;


// *********************************************************************//
// OLE Control Proxy class declaration
// Control Name     : TPdf
// Help String      : Acrobat Control for ActiveX
// Default Interface: _DPdf
// Def. Intf. DISP? : Yes
// Event   Interface: _DPdfEvents
// TypeFlags        : (34) CanCreate Control
// *********************************************************************//
  TPdf = class(TOleControl)
  private
    FIntf: _DPdf;
    function  GetControlInterface: _DPdf;
  protected
    procedure CreateControl;
    procedure InitControlData; override;
  public
    function LoadFile(const fileName: WideString): WordBool;
    procedure setShowToolbar(On_: WordBool);
    procedure gotoFirstPage;
    procedure gotoLastPage;
    procedure gotoNextPage;
    procedure gotoPreviousPage;
    procedure setCurrentPage(n: Integer);
    procedure goForwardStack;
    procedure goBackwardStack;
    procedure setPageMode(const pageMode: WideString);
    procedure setLayoutMode(const layoutMode: WideString);
    procedure setNamedDest(const namedDest: WideString);
    procedure Print;
    procedure printAllFit(shrinkToFit: WordBool);
    procedure setView(const viewMode: WideString);
    procedure printWithDialog;
    procedure setZoom(percent: Single);
    procedure setViewScroll(const viewMode: WideString; offset: Single);
    procedure setViewRect(left: Single; top: Single; width: Single; height: Single);
    procedure printPages(from: Integer; to_: Integer);
    procedure setZoomScroll(percent: Single; left: Single; top: Single);
    procedure setShowScrollbars(On_: WordBool);
    procedure printPagesFit(from: Integer; to_: Integer; shrinkToFit: WordBool);
    procedure printAll;
    function GetVersions: OleVariant;
    procedure setCurrentHightlight(a: Integer; b: Integer; c: Integer; d: Integer);
    procedure AboutBox;
    property  ControlInterface: _DPdf read GetControlInterface;
    property  DefaultInterface: _DPdf read GetControlInterface;
  published
    property Anchors;
    property  TabStop;
    property  Align;
    property  DragCursor;
    property  DragMode;
    property  ParentShowHint;
    property  PopupMenu;
    property  ShowHint;
    property  TabOrder;
    property  Visible;
    property  OnDragDrop;
    property  OnDragOver;
    property  OnEndDrag;
    property  OnEnter;
    property  OnExit;
    property  OnStartDrag;
    property src: WideString index 1 read GetWideStringProp write SetWideStringProp stored False;
  end;

procedure Register;

resourcestring
  dtlServerPage = 'Servers';

  dtlOcxPage = 'ActiveX';

implementation

uses ComObj;

procedure TPdf.InitControlData;
const
  CControlData: TControlData2 = (
    ClassID: '{CA8A9780-280D-11CF-A24D-444553540000}';
    EventIID: '';
    EventCount: 0;
    EventDispIDs: nil;
    LicenseKey: nil (*HR:$80004002*);
    Flags: $00000000;
    Version: 401);
begin
  ControlData := @CControlData;
end;

procedure TPdf.CreateControl;

  procedure DoCreate;
  begin
    FIntf := IUnknown(OleObject) as _DPdf;
  end;

begin
  if FIntf = nil then DoCreate;
end;

function TPdf.GetControlInterface: _DPdf;
begin
  CreateControl;
  Result := FIntf;
end;

function TPdf.LoadFile(const fileName: WideString): WordBool;
begin
  Result := DefaultInterface.LoadFile(fileName);
end;

procedure TPdf.setShowToolbar(On_: WordBool);
begin
  DefaultInterface.setShowToolbar(On_);
end;

procedure TPdf.gotoFirstPage;
begin
  DefaultInterface.gotoFirstPage;
end;

procedure TPdf.gotoLastPage;
begin
  DefaultInterface.gotoLastPage;
end;

procedure TPdf.gotoNextPage;
begin
  DefaultInterface.gotoNextPage;
end;

procedure TPdf.gotoPreviousPage;
begin
  DefaultInterface.gotoPreviousPage;
end;

procedure TPdf.setCurrentPage(n: Integer);
begin
  DefaultInterface.setCurrentPage(n);
end;

procedure TPdf.goForwardStack;
begin
  DefaultInterface.goForwardStack;
end;

procedure TPdf.goBackwardStack;
begin
  DefaultInterface.goBackwardStack;
end;

procedure TPdf.setPageMode(const pageMode: WideString);
begin
  DefaultInterface.setPageMode(pageMode);
end;

procedure TPdf.setLayoutMode(const layoutMode: WideString);
begin
  DefaultInterface.setLayoutMode(layoutMode);
end;

procedure TPdf.setNamedDest(const namedDest: WideString);
begin
  DefaultInterface.setNamedDest(namedDest);
end;

procedure TPdf.Print;
begin
  DefaultInterface.Print;
end;

procedure TPdf.printAllFit(shrinkToFit: WordBool);
begin
  DefaultInterface.printAllFit(shrinkToFit);
end;

procedure TPdf.setView(const viewMode: WideString);
begin
  DefaultInterface.setView(viewMode);
end;

procedure TPdf.printWithDialog;
begin
  DefaultInterface.printWithDialog;
end;

procedure TPdf.setZoom(percent: Single);
begin
  DefaultInterface.setZoom(percent);
end;

procedure TPdf.setViewScroll(const viewMode: WideString; offset: Single);
begin
  DefaultInterface.setViewScroll(viewMode, offset);
end;

procedure TPdf.setViewRect(left: Single; top: Single; width: Single; height: Single);
begin
  DefaultInterface.setViewRect(left, top, width, height);
end;

procedure TPdf.printPages(from: Integer; to_: Integer);
begin
  DefaultInterface.printPages(from, to_);
end;

procedure TPdf.setZoomScroll(percent: Single; left: Single; top: Single);
begin
  DefaultInterface.setZoomScroll(percent, left, top);
end;

procedure TPdf.setShowScrollbars(On_: WordBool);
begin
  DefaultInterface.setShowScrollbars(On_);
end;

procedure TPdf.printPagesFit(from: Integer; to_: Integer; shrinkToFit: WordBool);
begin
  DefaultInterface.printPagesFit(from, to_, shrinkToFit);
end;

procedure TPdf.printAll;
begin
  DefaultInterface.printAll;
end;

function TPdf.GetVersions: OleVariant;
begin
  Result := DefaultInterface.GetVersions;
end;

procedure TPdf.setCurrentHightlight(a: Integer; b: Integer; c: Integer; d: Integer);
begin
  DefaultInterface.setCurrentHightlight(a, b, c, d);
end;

procedure TPdf.AboutBox;
begin
  DefaultInterface.AboutBox;
end;

procedure Register;
begin
  RegisterComponents(dtlOcxPage, [TPdf]);
end;

end.
