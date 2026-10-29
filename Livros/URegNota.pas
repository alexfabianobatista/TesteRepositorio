unit URegNota;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ActnList;

type
  TFRegNota = class(TFTCadSimples)
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
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DSItem: TDataSource;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    BtnFilialCons: TBitBtn;
    BtnCadastroCons: TBitBtn;
    BtnOperacaoCons: TBitBtn;
    BtnTributacaoCons: TBitBtn;
    Operao1: TMenuItem;
    CancelarNota1: TMenuItem;
    VoltarCancelamento1: TMenuItem;
    LblSituacao: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
    procedure BtnFilialConsClick(Sender: TObject);
    procedure BtnCadastroConsClick(Sender: TObject);
    procedure BtnOperacaoConsClick(Sender: TObject);
    procedure BtnTributacaoConsClick(Sender: TObject);
    procedure SBCancelarClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure SBAlterarClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure CancelarNota1Click(Sender: TObject);
    procedure VoltarCancelamento1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegNota: TFRegNota;

implementation

uses URegNota_cl, UOracle_cl, UFilial_cl, UFilialCons, UCadastroCons, UCadastro_cl,
  UOperacaoCons, UOperacao_cl, UTributacaoCons, UTributacao_cl,
  UUsuario_cl, URegNotaCons, UNotaSaida_cl, UNotaEntrada_cl,
  UNotaSaida_Cancela, UNotaEntrada_Cancela;

{$R *.DFM}

procedure TFRegNota.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMNotaEntrada.QNotaEntrada.Close;
  DMNotaEntrada.QItemNF.Close;
  DMNotaSaida.QNotaSaida.Close;
  DMNotaEntrada.QItemNF.Close;
  DMRegNota.QRegNotaCons.Close;
  DMRegNota.QNotaCab.Close;
  DMRegNota.QNotaItem.Close;
  Action := Cafree;
  FRegNota := nil;
end;

procedure TFRegNota.FormActivate(Sender: TObject);
begin
  inherited;
  DMRegNota.QNotaCab.Open;
  DMRegNota.QNotaItem.Open;
end;

procedure TFRegNota.SBIncluirClick(Sender: TObject);
begin
  inherited;
  With DMRegNota Do
  Begin
    If not DMOracle.DBCemapa.InTransaction Then
      DMOracle.DBCemapa.StartTransaction;
    QNotaCab.Insert;
    QNotaCabIND_SITUACAO.Text := '2';
    QNotaCabIND_ENTRADA_SAIDA.Text := 'E';
    QNotaCabDT_MOVIMENTO.Value := DMOracle.DataHoraServ;
    QNotaCabCOD_USUARIO.Value := DMUsuario.CodUsuarioCorrente;
    QNotaCabDT_USUARIO.Value := DMOracle.DataHoraServ;
    QNotaCabDt_Emissao.Value := DMOracle.DataServ;
    QNotaCabDt_Recebimento.Value := DMOracle.DataServ;
    QNotaCabCod_Transporte.Value := 1;
    QNotaCabInd_Condicao_Pagto.Value := '1';
    QNotaCabCod_Filial.Value := DMUsuario.CodFilialUsuario;
    QNotaCabIND_TIPO_FRETE.Value := 'CIF';
    QNotaCabVal_Pedagio.Value := 0;
    QNotaCabVal_FunRural.Value := 0;
    QNotaCabIND_CONDICAO_PAGTO.Value := '1';
    QNotaCabVAL_DESPESAS.Value := 0;
    QNotaCabVAL_FRETE.Value := 0;
    QNotaCabVAL_ICM_FRETE.Value := 0;
    QNotaCabVAL_ICM_BASE_FRETE.Value := 0;
    QNotaCabVAL_FUNRURAL.Value := 0;
    QNotaCabPERC_COMISSAO.Value := 0;

    If DMUsuario.CodVendedorPadrao > 0 Then
      QNotaCabCod_Vendedor.Value := DMUsuario.CodVendedorPadrao;
    If DMUsuario.CodDepartamentoUsuario > 0 Then
      QNotaCabCod_Departamento.Value := DMUsuario.CodDepartamentoUsuario;
    If DMUsuario.CodOperacaoPadrao > 0 Then
      QNotaCabCod_Operacao.Value := DMUsuario.CodOperacaoPadrao;
    If DMUsuario.CodClientePadrao > 0 Then
      QNotaCabCod_Cadastro.Value := DMUsuario.CodClientePadrao;
    If DMUsuario.CodSeriePadrao <> '' Then
      QNotaCabCod_Serie.Value := DMUsuario.CodSeriePadrao;
  End;
end;

procedure TFRegNota.SBConfirmarClick(Sender: TObject);
begin
  With DMRegNota Do
  Begin
      If(QNotaItem.State in[DsInsert,DsEdit])Then
        QNotaItem.Post;
      inherited;
      If DMOracle.DBCemapa.InTransaction Then
      Begin
        DMOracle.DBCemapa.Commit;
        //QNotaCab.RefreshRecord;
        SBRefreshClick(Self);
      End;
  End;
end;

procedure TFRegNota.BtnFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
  Begin
    DMRegNota.QNotaCabCOD_FILIAL.Text := DMFilial.QFilialConsCod_Filial.Text;
  End;
end;

procedure TFRegNota.BtnCadastroConsClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
  Begin
    DMRegNota.QNotaCabCOD_CADASTRO.Text := DMCadastro.QCadastroConsCOD_CADASTRO.Text;
    DMRegNota.QNotaCabCOD_ESTADO.Text := DMCadastro.QCadastroConsCOD_ESTADO.Text;
  End;
end;

procedure TFRegNota.BtnOperacaoConsClick(Sender: TObject);
begin
  inherited;
  If FOperacaoCons = Nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  If FOperacaoCons.ShowModal = mrOk then
  Begin
    DMRegNota.QNotaCabCOD_OPERACAO.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
  End;
end;

procedure TFRegNota.BtnTributacaoConsClick(Sender: TObject);
begin
  inherited;
  If FTributacaoCons = Nil then
    FTributacaoCons := TFTributacaoCons.Create(Application);
  If FTributacaoCons.ShowModal = mrOk then
  Begin
    If(DMRegNota.QNotaItemCOD_NOTA_ITEM.IsNull)Then
      DMRegNota.QNotaItem.Insert
    Else
      If(DMRegNota.QNotaItem.State <> DsEdit)Then
        DMRegNota.QNotaItem.Edit;
    DMRegNota.QNotaItemCOD_TRIBUTACAO.Value := DMTributacao.QTributacaoConsCOD_TRIBUTACAO.Value;
  End;
end;

procedure TFRegNota.SBCancelarClick(Sender: TObject);
begin
  //inherited;
  With DMRegNota Do
  Begin
    If(QNotaItem.State in[DsInsert,DsEdit])Then
      QNotaItem.Cancel;
    If(QNotaCab.State in[DsInsert,DsEdit])Then
      QNotaCab.Cancel;
  End;
  If DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.Rollback;
end;

procedure TFRegNota.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  If(NOT DMRegNota.QNotaCabCOD_CADASTRO.IsNull)Then
   DMRegNota.QNotaCabCOD_ESTADO.Value := DMOracle.BuscaNome('SELECT COD_ESTADO FROM TB_CADASTRO','COD_CADASTRO = ' + DMRegNota.QNotaCabCOD_CADASTRO.Text);
end;

procedure TFRegNota.SBExcluirClick(Sender: TObject);
begin
  inherited;
  If DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.Commit;
end;

procedure TFRegNota.SBAlterarClick(Sender: TObject);
begin
  inherited;
  If not DMOracle.DBCemapa.InTransaction Then
    DMOracle.DBCemapa.StartTransaction;
end;

procedure TFRegNota.DSPrimarioStateChange(Sender: TObject);
var
  wbooflag : Boolean;
begin
  inherited;
  wbooflag := (DSPrimario.State in [dsInsert,dsEdit]);
  BtnOperacaoCons.Enabled := wbooflag;
  BtnTributacaoCons.Enabled := wbooflag;
  BtnCadastroCons.Enabled := wbooflag;
  BtnFilialCons.Enabled := wbooflag;
  MMCadSimples.Items[2].Enabled := not wbooflag; // Operacoes
  If(NOT DMRegNota.QNotaCabIND_SITUACAO.IsNull)AND(NOT DMOracle.DBCemapa.InTransaction)Then
    Case StrToInt(DMRegNota.QNotaCabIND_SITUACAO.Text) Of
      1: LblSituacao.Caption := 'DIGITADA';
      2: LblSituacao.Caption := 'CONFIRMADA';
      3: LblSituacao.Caption := 'CANCELADA';
    End
  Else
    LblSituacao.Caption := '';
end;

procedure TFRegNota.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If(FRegNotaCons = nil)Then
    FRegNotaCons := TFRegNotaCons.Create(Application);
  If(FRegNotaCons.showmodal = mrOk)Then
  Begin
    DMRegNota.QNotaCab.Close;
    DMRegNota.QNotaCab.SetVariable('PK',DMRegNota.QRegNotaConsCOD_NOTA_CAB.Text);
    DMRegNota.QNotaCab.open;
  End;
end;

procedure TFRegNota.CancelarNota1Click(Sender: TObject);
begin
  inherited;
  With DMRegNota Do
  Begin
    If(QNotaCabIND_ENTRADA_SAIDA.Text = 'S')Then
    Begin
      DMNotaSaida.QNotaSaida.Close;
      DMNotaSaida.QNotaSaida.SetVariable('PK',QNotaCabCOD_NOTA_CAB.Text);
      DMNotaSaida.QNotaSaida.Open;
      DMNotaSaida.QItemNF.open;
      If DMNotaSaida.QNotaSaidaInd_Situacao.Value = '3' Then
         Raise Exception.Create('Esta Nota Fiscal já está cancelada!');
      If DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA','COD_NOTA_CAB = '+FloatToStr(DMNotaSaida.QNotaSaidaCod_Nota_Cab.Value)) <> '' Then
         raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
      If FNotaSaida_Cancela = Nil then
         FNotaSaida_Cancela := TFNotaSaida_Cancela.Create(Application);
      FNotaSaida_Cancela.ShowModal;
    End
    Else
    Begin
      DMNotaEntrada.QNotaEntrada.Close;
      DMNotaEntrada.QNotaEntrada.SetVariable('PK',QNotaCabCOD_NOTA_CAB.Text);
      DMNotaEntrada.QNotaEntrada.Open;
      DMNotaEntrada.QItemNF.Open;
      If DMNotaEntrada.QNotaEntradaInd_Situacao.Value = '3' Then
        Raise Exception.Create('Esta Nota Fiscal já está cancelada!');
      If DMOracle.BuscaNome('SELECT COD_RPA FROM TB_RPA','COD_NOTA_CAB = '+FloatToStr(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value)) <> '' Then
        raise Exception.Create('Está Nota Possui um RPA - Favor Verificar!');
      If FNotaEntrada_Cancela = Nil then
        FNotaEntrada_Cancela := TFNotaEntrada_Cancela.Create(Application);
      FNotaEntrada_Cancela.ShowModal;
    End;
    SBRefreshClick(Self);
  End;
end;

procedure TFRegNota.VoltarCancelamento1Click(Sender: TObject);
begin
  inherited;
  If(DMRegNota.QNotaCabIND_ENTRADA_SAIDA.Text = 'S')Then
    DMNotaSaida.VoltaCancelamento
  Else
    DMNotaEntrada.VoltaCancelamento(DMNotaEntrada.QNotaEntradaCod_Nota_Cab.Value);
  SBRefreshClick(Self);
end;

end.
