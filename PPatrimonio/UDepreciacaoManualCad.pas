unit UDepreciacaoManualCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, Grids, DBGrids, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFDepreciacaoManualCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SBPatrimonio: TSpeedButton;
    DBDirceu11: TDBDirceu;
    SBGerarProximoMes: TSpeedButton;
    DBGrid1: TDBGrid;
    DSDepreciacaoLista: TDataSource;
    Label5: TLabel;
    procedure SBPatrimonioClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBGerarProximoMesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
    procedure MELocalizaExit(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDepreciacaoManualCad: TFDepreciacaoManualCad;

implementation

uses UDepreciacao_cl, UPatrimonioItensCons, UPatrimonio_cl;

{$R *.DFM}

procedure TFDepreciacaoManualCad.SBPatrimonioClick(Sender: TObject);
begin
  inherited;
  If FPatrimonioItensCons = nil Then
    FPatrimonioItensCons := TFPatrimonioItensCons.Create(Application);
  If FPatrimonioItensCons.ShowModal = mrOk Then
    DMDepreciacao.QDepreciacaoPatrimonioCadCOD_PATRIMONIO_ITEM.Value := DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_ITEM.Value;
end;

procedure TFDepreciacaoManualCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If (DSPrimario.State in [dsInsert,dsEdit]) Then
  begin
    SBPatrimonio.Enabled := true;
    SBGerarProximoMes.Enabled := false;
  end
  Else
  begin
    SBPatrimonio.Enabled := false;
    SBGerarProximoMes.Enabled := true;
  end;
end;

Function FirstDayOfMonth (Data : TDateTime; lSabDom : Boolean) : TDateTime;
var
  Ano, Mes, Dia : word;
  DiaDaSemana : Integer;
begin
  DecodeDate (Data, Ano, Mes, Dia);
  Dia := 1;
  if lSabDom Then
  begin
    DiaDaSemana := DayOfWeek (Data);
    if DiaDaSemana = 1 Then
      Dia := 2
    else
      if DiaDaSemana = 7 Then
        Dia := 3;
  end;
  FirstDayOfMonth := EncodeDate (Ano, Mes, Dia);
end;

Function LastDayOfMonth (Data : TDateTime; lSabDom : Boolean) : TDateTime;
var
  Ano, Mes, Dia : word;
  AuxData : TDateTime;
  DiaDaSemana : Integer;
begin
  AuxData := FirstDayOfMonth (IncMonth (Data, 1), False) - 1;
  if lSabDom Then
  begin
    DecodeDate (Auxdata, Ano, Mes, Dia);
    DiaDaSemana := DayOfWeek (AuxData);
    if DiaDaSemana = 1 Then
      Dia := Dia - 2
    else
      if DiaDaSemana = 7 Then
    Dec (Dia);
    AuxData := EnCodeDate (Ano, Mes, Dia);
  end;
  LastDayOfMonth := AuxData;
end;

procedure TFDepreciacaoManualCad.SBGerarProximoMesClick(Sender: TObject);
begin
  inherited;
  BtCopia.Click;

  DMDepreciacao.QDepreciacaoPatrimonioCadDT_DEPRECIACAO.Value :=
    LastDayOfMonth(IncMonth(DMDepreciacao.QDepreciacaoPatrimonioCadDT_DEPRECIACAO.Value, 1), false);
end;

procedure TFDepreciacaoManualCad.FormCreate(Sender: TObject);
begin
  inherited;
  DMDepreciacao.QDepreciacaoPatrimonioCad.close;
  DMDepreciacao.QDepreciacaoPatrimonioCad.open;
end;

procedure TFDepreciacaoManualCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
var
  cod : integer;
begin
  inherited;

  if DSPrimario.State in [dsInsert, dsEdit] then exit;

  if integer(DMDepreciacao.QDepreciacaoPatrimonioCad.GetVariable('COD_PATRIMONIO_ITEM')) <>
     DMDepreciacao.QDepreciacaoPatrimonioCadCOD_PATRIMONIO_ITEM.Value then
  begin
    cod := DMDepreciacao.QDepreciacaoPatrimonioCadCOD_PATRIMONIO_ITEM.Value;
    DMDepreciacao.QDepreciacaoPatrimonioCad.close;
    DMDepreciacao.QDepreciacaoPatrimonioCad.setVariable('COD_PATRIMONIO_ITEM', cod);
    DMDepreciacao.QDepreciacaoPatrimonioCad.open;

    DMDepreciacao.QDepreciacaoPatrimonioCad.Locate('COD_DEPRECIACAO_PATRIMONIO', DMDepreciacao.QDepreciacaoPatrimonioCad.GetVariable('PK'), []);

  end;

  //DMDepreciacao.QDepreciacaoPatrimonioLista.Close;
  //DMDepreciacao.QDepreciacaoPatrimonioLista.SetVariable('COD_PATRIMONIO_ITEM', DMDepreciacao.QDepreciacaoPatrimonioCadCOD_PATRIMONIO_ITEM.Value);
  //DMDepreciacao.QDepreciacaoPatrimonioLista.Open;
end;

procedure TFDepreciacaoManualCad.MELocalizaExit(Sender: TObject);
begin

  DMDepreciacao.QDepreciacaoPatrimonioCad.setVariable('COD_PATRIMONIO_ITEM', 0);

  inherited;

end;

procedure TFDepreciacaoManualCad.SBConsultaClick(Sender: TObject);
begin
  DMDepreciacao.QDepreciacaoPatrimonioCad.setVariable('COD_PATRIMONIO_ITEM', 0);
  inherited;

  If FPatrimonioItensCons = nil Then
    FPatrimonioItensCons := TFPatrimonioItensCons.Create(Application);
  If FPatrimonioItensCons.ShowModal = mrOk Then
  Begin
    DMDepreciacao.QDepreciacaoPatrimonioCad.Close;
    DMDepreciacao.QDepreciacaoPatrimonioCad.SetVariable( 'COD_PATRIMONIO_ITEM', DMPatrimonio.QPatrimonioItemConsCOD_PATRIMONIO_ITEM.Value );
    DMDepreciacao.QDepreciacaoPatrimonioCad.Open;
  End;
end;

procedure TFDepreciacaoManualCad.FormActivate(Sender: TObject);
begin
  inherited;
  MELocaliza.Visible := False;
end;

end.
