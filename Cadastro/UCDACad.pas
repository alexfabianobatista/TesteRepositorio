unit UCDACad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, DBDirceu, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFCDACad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    SBCidade: TSpeedButton;
    DBDirceu1: TDBDirceu;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    procedure SBCidadeClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FCDACad: TFCDACad;

implementation

uses UCDA_cl, UCidadeCad, UCidade_cl, UCidadeCons, UCDACons;

{$R *.DFM}

procedure TFCDACad.SBCidadeClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = nil then
    FCidadeCons := TFCidadeCons.create(application);

  if FCidadeCons.showmodal = mrok then
    DMCDA.QCDACOD_CIDADE.asInteger := DMCidade.QCidadeConsCOD_CIDADE.AsInteger;
end;

procedure TFCDACad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [dsInsert, dsEdit] then
    SBCidade.Enabled := true
  else
    SBCidade.Enabled := false;
end;

procedure TFCDACad.FormCreate(Sender: TObject);
begin
  inherited;
  DMCDA.QCDA.close;
  DMCDA.QCDA.Open;
end;

procedure TFCDACad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FCDACons = Nil then
    FCDACons:= TFCDACons.Create(Application);
  If FCDACons.Showmodal = mrOk then
  With DMCDA do
  Begin
    QCDA.Close;
    QCDA.SetVariable('PK', QCDAConsCOD_CDA.Value);
    QCDA.Open;
  End;
end;

end.
