unit UDCOCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls;

type
  TFDCOCad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btNota: TBitBtn;
    btNota2: TBitBtn;
    DCOs1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure btNotaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure btNota2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDCOCad: TFDCOCad;

implementation

uses UDCO_cl, UNotaSaidaCons, UNotaSaida_cl, UDCOCons, UNotaEntradaCons,
  UNotaEntrada_cl;

{$R *.DFM}

procedure TFDCOCad.FormCreate(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet = nil then
    DSPrimario.DataSet := DMDCO.QDCO;
end;

procedure TFDCOCad.btNotaClick(Sender: TObject);
begin
  inherited;
  If FNotaSaidaCons = Nil then
     FNotaSaidaCons := TFNotaSaidaCons.Create(Application);
  If FNotaSaidaCons.ShowModal = mrOk then
    DMDCO.QDCOCOD_NOTA_CAB.Value := DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value;
end;

procedure TFDCOCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMDCO.QDCO.Close;
  DMDCO.QDCO.Open;
end;

procedure TFDCOCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DsPrimario.State in [DSInsert,DsEdit] then
  begin
    btNota.Enabled := true;
    btNota2.Enabled := true;
  end
  else
  begin
    btNota.Enabled := false;
    btNota2.Enabled := false;
  end;
end;

procedure TFDCOCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FDCOCons = nil then
    FDCOCons := TFDCOCons.create(application);

  if FDCOCons.showmodal = mrok then
  begin
    DMDCO.QDCO.close;
    DMDCO.QDCO.SetVariable('PK',DMDCO.QDCOConscod_dco.value);
    DMDCO.QDCO.open;
  end
end;

procedure TFDCOCad.btNota2Click(Sender: TObject);
begin
  inherited;
  If FNotaEntradaCons = Nil then
     FNotaEntradaCons := TFNotaEntradaCons.Create(Application);
  If FNotaEntradaCons.ShowModal = mrOk then
    DMDCO.QDCOCOD_NOTA_CAB.Value := DMNotaEntrada.QNotaEntradaConsCOD_NOTA_CAB.Value;
end;

end.
