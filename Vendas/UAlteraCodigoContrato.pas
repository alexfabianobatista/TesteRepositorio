unit UAlteraCodigoContrato;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, ActnList, ComCtrls;

type
  TFAlteraCodigoContrato = class(TForm)
    Label1: TLabel;
    MeContratoCompra: TMaskEdit;
    Label2: TLabel;
    MeContratoVend: TMaskEdit;
    BtConsVendedorPre: TBitBtn;
    BitBtn1: TBitBtn;
    BtConfirmar: TBitBtn;
    BitBtn2: TBitBtn;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action1: TAction;
    procedure BitBtn1Click(Sender: TObject);
    procedure BtConsVendedorPreClick(Sender: TObject);
    procedure BtConfirmarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    wTela : String;
    { Public declarations }
  end;

var
  FAlteraCodigoContrato: TFAlteraCodigoContrato;

implementation

uses UContratoVenda_Cons, UOracle_cl, UNotaSaida_cl, UNotaEntrada_cl,
  Ucontrato_cl, UContrato_PJuridicaCons, UContrato_Pjuridica_cl,
  UParamSistema_cl, UImpressoraFiscal;

{$R *.dfm}

procedure TFAlteraCodigoContrato.BitBtn1Click(Sender: TObject);
begin
  If FContrato_VendaCons = Nil Then
     FContrato_VendaCons := TFContrato_VendaCons.Create(Application);
  If FContrato_VendaCons.ShowModal = MrOk Then
     MeContratoVend.Text := DMContrato.QContrato_VendConsCod_Contrato_Vend.Text;
end;

procedure TFAlteraCodigoContrato.BtConsVendedorPreClick(Sender: TObject);
begin
  if FContrato_PJuridicaCons = nil then
    FContrato_PJuridicaCons := TFContrato_PJuridicaCons.Create(Application);
  if FContrato_PJuridicaCons.ShowModal = mrOk then
    MeContratoCompra.Text := DMContrato_PJuridica.QContratoPJuridicaConsCOD_CONTRATO_PJURIDICA.Text;

end;

procedure TFAlteraCodigoContrato.BtConfirmarClick(Sender: TObject);
begin
  With DMOracle do
  Begin
    try
      DBCemapa.StartTransaction;
      If Trim(MeContratoVend.Text) <> '' Then
       Begin
         QExecSQL.Close;
         QExecSQL.SQL.Clear;
         QExecSQL.SQL.Add('UPDATE TB_NOTA_CAB SET COD_CONTRATO_VEND = '+Trim(MeContratoVend.Text));
         QExecSQL.SQL.Add(' WHERE COD_NOTA_CAB = ');
         If wTela = 'VENDA' then
            QExecSQL.SQL.Add(Trim(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text))
         Else
            QExecSQL.SQL.Add(Trim(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text));
         QExecSQL.ExecSQL;
       End;
      If Trim(MeContratoCompra.Text) <> '' Then
       Begin
         QExecSQL.Close;
         QExecSQL.SQL.Clear;

         QExecSQL.SQL.Add('UPDATE TB_NOTA_CAB SET COD_CONTRATO_PJURIDICA = '+Trim(MeContratoCompra.Text));
         QExecSQL.SQL.Add(' WHERE COD_NOTA_CAB = ');
         If wTela = 'VENDA' then
            QExecSQL.SQL.Add(Trim(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Text))
         Else
            QExecSQL.SQL.Add(Trim(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Text));
         QExecSQL.ExecSQL;
       End;
      DBCemapa.Commit;
      If wTela = 'VENDA' then
        DMNotaSaida.QNotaSaida.RefreshRecord
      else
        DMNotaEntrada.QNotaEntrada.RefreshRecord;
    except
      DBCemapa.Rollback;
    end;
  end;
end;

procedure TFAlteraCodigoContrato.FormActivate(Sender: TObject);
begin
  MeContratoCompra.Clear;
  MeContratoVend.Clear;
end;

procedure TFAlteraCodigoContrato.FormCreate(Sender: TObject);
begin
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
end;

procedure TFAlteraCodigoContrato.Action1Execute(Sender: TObject);
begin
  if FImpressoraFiscal = Nil then
    FImpressoraFiscal := TFImpressoraFiscal.Create(Application);
  FImpressoraFiscal.ShowModal;
end;

end.
