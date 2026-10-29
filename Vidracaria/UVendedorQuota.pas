unit UVendedorQuota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, Grids, DBGrids, DBCtrls, Spin, variants;

type
  TFVendedorQuota = class(TFTCadSimples)
    GroupBox1: TGroupBox;
    MEVendedor: TMaskEdit;
    Label1: TLabel;
    BtConsVendedor: TBitBtn;
    EdVendedor: TEdit;
    DBGrid1: TDBGrid;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBE_Ano: TDBEdit;
    DBE_Mes: TDBEdit;
    DBEdit6: TDBEdit;
    BtConVendedorCad: TBitBtn;
    BtConsClasse: TBitBtn;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    BtReplica: TBitBtn;
    MEAno: TMaskEdit;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    QuotaporVendedor1: TMenuItem;
    Opes1: TMenuItem;
    ReplicarCotasVendedores1: TMenuItem;
    procedure BtConsVendedorClick(Sender: TObject);
    procedure MEVendedorExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtConVendedorCadClick(Sender: TObject);
    procedure BtConsClasseClick(Sender: TObject);
    procedure BtReplicaClick(Sender: TObject);
    procedure MEAnoExit(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure QuotaporVendedor1Click(Sender: TObject);
    procedure ReplicarCotasVendedores1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVendedorQuota: TFVendedorQuota;

implementation

uses UVendedor_cl, UVendedorCons, UClasseCons, UClasse_cl,
  UVendedorQuotaCons, UVendedorParam, URVendedorQuota, UOracle_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFVendedorQuota.BtConsVendedorClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.create(Application);
  If FVendedorCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    MEVendedor.Text := QVendedorConsCod_Vendedor.Text;
    MEVendedorExit(Self);
  End;
end;

procedure TFVendedorQuota.MEVendedorExit(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    If Trim(MEVendedor.Text) = '' then
    Begin
      EdVendedor.Text := 'Todos';
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('VENDEDOR',Null);
      QQuotaVendedor.Open;
    End
    Else
    With DMVendedor do
    Begin
      QVendedor.Close;
      QVendedor.SetVariable('PK',StrToInt(Trim(MEVendedor.Text)));
      QVendedor.Open;
      EdVendedor.Text := QVendedorNome.Text;
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('VENDEDOR',StrToInt(Trim(MEVendedor.Text)));
      QQuotaVendedor.Open;
    End;
  End;
end;

procedure TFVendedorQuota.FormActivate(Sender: TObject);
begin
  inherited;
  DMVendedor.QQuotaVendedor.Open;
  If DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'CGS' then
  Begin
    FVendedorQuota.Label4.Caption := 'Quota/Peças';
    FVendedorQuota.Label8.Caption := 'Quota/Valor';
  end;
end;

procedure TFVendedorQuota.BtConVendedorCadClick(Sender: TObject);
begin
  inherited;
  If FVendedorCons = Nil then
    FVendedorCons := TFVendedorCons.create(Application);
  If FVendedorCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    QQuotaVendedorCod_Vendedor.Value := QVendedorConsCod_Vendedor.Value;
  End;
end;

procedure TFVendedorQuota.BtConsClasseClick(Sender: TObject);
begin
  inherited;
  If FClasseCons = Nil then
    FClasseCons := TFClasseCons.create(Application);
  If FClasseCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    QQuotaVendedorCod_Classe.Value := DMClasse.QClasseConsCod_Classe.Value;
  End;
end;

procedure TFVendedorQuota.BtReplicaClick(Sender: TObject);
Var wOldVendedor, wOldClasse, wOldAno, wOldMes  : Integer;
     wOldQtde : Real;
begin
  inherited;
  With DMVendedor do
  Begin
    wOldVendedor := QQuotaVendedorCod_Vendedor.Value;
    wOldClasse := QQuotaVendedorCod_Classe.Value;
    wOldQtde := QQuotaVendedorQt_Quota.Value;
    wOldAno := QQuotaVendedorNum_Ano.Value;
    wOldMes := QQuotaVendedorNum_Mes.Value;
    SBIncluirClick(Self);
    QQuotaVendedorCod_Vendedor.Value := wOldVendedor;
    QQuotaVendedorCod_Classe.Value := wOldClasse;
    QQuotaVendedorQt_Quota.Value := wOldQtde;
    QQuotaVendedorNum_Ano.Value := wOldAno;
    QQuotaVendedorNum_Mes.Value := wOldMes;
  End;
end;

procedure TFVendedorQuota.MEAnoExit(Sender: TObject);
begin
  inherited;
  With DMVendedor do
  Begin
    If Trim(MEAno.Text) = '' then
    Begin
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('ANO',Null);
      QQuotaVendedor.Open;
    End
    Else
    With DMVendedor do
    Begin
      QQuotaVendedor.Close;
      QQuotaVendedor.SetVariable('ANO',StrToFloat(Trim(MEAno.Text)));
      QQuotaVendedor.Open;
    End;
  End;
end;

procedure TFVendedorQuota.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(32);
end;

procedure TFVendedorQuota.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FVendedorQuotaCons = Nil then
    FVendedorQuotaCons := TFVendedorQuotaCons.Create(Application);
  If FVendedorQuotaCons.ShowModal = mrOk then
  With DMVendedor do
  Begin
    QQuotaVendedor.Close;
    QQuotaVendedor.SetVariable('PK',QQuotaVendedorConsCod_Vendedor.Value);
    QQuotaVendedor.Open;
  End;  
end;

procedure TFVendedorQuota.QuotaporVendedor1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = Nil then
     FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[2].TabVisible := True;
  if FVendedorParam.ShowModal = mrOk then
  with DMVendedor do
  begin
    QRVendedorQuota.Close;
   if Trim(FVendedorParam.ME2Vendedor.Text)<>'' then
       QRVendedorQuota.SetVariable('VENDEDOR',FVendedorParam.ME2Vendedor.Text)
    else
       QRVendedorQuota.SetVariable('VENDEDOR',Null);

    if Trim(FVendedorParam.ME2Classe.Text)<>'' then
       QRVendedorQuota.SetVariable('CLASSE',FVendedorParam.ME2Classe.Text)
    else
       QRVendedorQuota.SetVariable('CLASSE',Null);
    if Trim(FVendedorParam.ME2Ano.Text)<>'' then
       QRVendedorQuota.SetVariable('ANO',FVendedorParam.ME2Ano.Text)
    else
       QRVendedorQuota.SetVariable('ANO',Null);
    QRVendedorQuota.Open;

    if FrVendedorQuota = nil then
       FrVendedorQuota := TFrVendedorQuota.Create(Application);
    FrVendedorQuota.QRLTitulo.Caption := 'Relatório de Quota por Vendedor';

    if FVendedorParam.RGPreview.ItemIndex = 0 then
       FrVendedorQuota.QRPrimario.Preview
    else
       FrVendedorQuota.QRPrimario.Print;
    QrVendedorQuota.Close;

  end;
end;

procedure TFVendedorQuota.ReplicarCotasVendedores1Click(Sender: TObject);
begin
  inherited;
  if FVendedorParam = Nil then
     FVendedorParam := TFVendedorParam.Create(Application);
  FVendedorParam.PGRelatorio.Pages[4].TabVisible := True;
  if FVendedorParam.ShowModal = mrOk then
  begin
    if trim(FVendedorParam.edt4Ano.Text) = '' then
      raise Exception.create('Informe o Ano');
    if trim(FVendedorParam.edt4Mes.Text) = '' then
      raise Exception.create('Informe o Mês');

    DMOracle.DBCemapa.StartTransaction;
    try
      DMVendedor.QReplicaCotasVendedor.SetVariable('NUM_MES', strtoint(trim(FVendedorParam.edt4Mes.text)));
      DMVendedor.QReplicaCotasVendedor.SetVariable('NUM_ANO', strtoint(trim(FVendedorParam.edt4Ano.text)));

      DMVendedor.QReplicaCotasVendedor.ExecSQL;
      DMOracle.DBCemapa.Commit;

      MessageDlg('Cotas Replicadas com sucesso', mtConfirmation, [mbok], 0);
    except
      DMOracle.DBCemapa.Rollback;
      raise;
    end;
  end;
end;

end.

