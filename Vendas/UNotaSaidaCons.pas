unit UNotaSaidaCons;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCONSULTA, Db, Grids, DBGrids, StdCtrls, Mask, Buttons, ExtCtrls, variants,
  Menus, ActnList, ComCtrls;

type
  TFNotaSaidaCons = class(TFTConsulta)
    BtConsCadastro: TBitBtn;
    Label2: TLabel;
    MENumNota: TMaskEdit;
    RGSituacao: TRadioGroup;
    MEDtInicial: TMaskEdit;
    Label3: TLabel;
    MEDtFinal: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    MeFilial: TMaskEdit;
    BtFilialCons: TBitBtn;
    Label6: TLabel;
    MeSerie: TMaskEdit;
    BtConsSerie: TBitBtn;
    DBGrid2: TDBGrid;
    DSItensNfCons: TDataSource;
    BtnRetorno: TBitBtn;
    Label7: TLabel;
    MeObservacao: TMaskEdit;
    MENumNFSe: TMaskEdit;
    Label8: TLabel;
    ACLMenuFiscal: TActionList;
    Action1: TAction;
    StatusBar1: TStatusBar;
    LBVariosRegistros: TLabel;
    Label9: TLabel;
    MeOperacao: TMaskEdit;
    BitBtn1: TBitBtn;
    CBNotasPendentesContingencia: TCheckBox;
    LbOs: TLabel;
    MeOS: TMaskEdit;
    BtOs: TBitBtn;
    procedure BtProcurarClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtFilialConsClick(Sender: TObject);
    procedure BtConsSerieClick(Sender: TObject);
    procedure METextoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DSConsultaDataChange(Sender: TObject; Field: TField);
    procedure FormActivate(Sender: TObject);
    procedure BtnRetornoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtOsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    wRetornoCondicional: Boolean;
  end;

var
  FNotaSaidaCons: TFNotaSaidaCons;

implementation

uses UNotaSaida_cl, UCadastroCons, UCadastro_cl, UFilialCons, UFilial_cl,
  USerieCons, USerie_cl, UParamSistema_cl, UUsuario_cl, UOracle_cl, UOperacao_cl, UOperacaoCons, {UOrdemServicoCons,}
  UOrdemServico_cl;

{$R *.DFM}

procedure TFNotaSaidaCons.BtProcurarClick(Sender: TObject);
var
  wDescTipoFuncionario: String;
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario(Trim(MeFilial.Text), 'VENDA');
  With DMNotaSaida do
  Begin
    QNotaSaidaCons.Close;
    If Trim(METexto.Text) <> '' Then
      QNotaSaidaCons.SetVariable('CADASTRO',Trim(METexto.Text))
    Else
      QNotaSaidaCons.SetVariable('CADASTRO',Null);

    If Trim(MENumNota.Text) <> '' Then
      QNotaSaidaCons.SetVariable('NUM_NOTA',StrToInt(Trim(MENumNota.Text)))
    Else
      QNotaSaidaCons.SetVariable('NUM_NOTA',Null);

    If Trim(MeFilial.Text) <> '' Then
      QNotaSaidaCons.SetVariable('COD_FILIAL',StrToInt(Trim(MeFilial.Text)))
    Else
      QNotaSaidaCons.SetVariable('COD_FILIAL',Null);
    If Trim(MeSerie.Text) <> '' Then
      QNotaSaidaCons.SetVariable('COD_SERIE',Trim(MeSerie.Text))
    Else
      QNotaSaidaCons.SetVariable('COD_SERIE',Null);
    if DMParamSistema.CodEmpresa = 'PRAIASMI' then  // 06-12-2023 - PRAIASMI Pedro
    begin
      If Trim(MeObservacao.Text) <> '' Then
        QNotaSaidaCons.SetVariable('OBS','%'+Trim(MeObservacao.Text)+'%')
      Else
        QNotaSaidaCons.SetVariable('OBS',Null);
    end
    else
    begin
      If Trim(MeObservacao.Text) <> '' Then
        QNotaSaidaCons.SetVariable('DESC_OBSERVACAO','%'+Trim(MeObservacao.Text)+'%')
      Else
        QNotaSaidaCons.SetVariable('DESC_OBSERVACAO',Null);
    end;
    If Trim(MENumNFSe.Text) <> '' Then
      QNotaSaidaCons.SetVariable('NUM_NFSE','%'+Trim(MENumNFSe.Text))
    Else
      QNotaSaidaCons.SetVariable('NUM_NFSE',Null);
    If CBNotasPendentesContingencia.Checked then
      QNotaSaidaCons.SetVariable('IND_PENDENTE', 1)
    Else
      QNotaSaidaCons.SetVariable('IND_PENDENTE', Null);
    If Trim(MeOperacao.Text) <> '' Then
      QNotaSaidaCons.SetVariable('COD_OPERACAO', Trim(MeOperacao.Text))
    Else
      QNotaSaidaCons.SetVariable('COD_OPERACAO',Null);

   //ORDEM DE SERVICO - RETIFOZ
   if Trim(MeOS.Text) <> '' then
     QNotaSaidaCons.SetVariable('COD_ORDEM_SERVICO_CAB', Trim(MeOS.Text))
   else
     QNotaSaidaCons.SetVariable('COD_ORDEM_SERVICO_CAB', null);

    if (DMParamSistema.CodEmpresa <> 'FERRAGMED') and (DMParamSistema.CodEmpresa <> 'DONABENTA') and (DMParamSistema.CodEmpresa <> 'FERRAGENS') then
    begin
      // serve para o vendedor somente conseguir consultar suas vendas rafael 04/06/2014 solicitado por marcos cemapa
      wDescTipoFuncionario := DMOracle.BuscaNome('SELECT DESC_TIPO_FUNCIONARIO FROM TB_USUARIO', 'COD_USUARIO = ' + IntToStr(DMUsuario.CodUsuarioCorrente));
      if (not DMUsuario.Privilegiado) and
         (wDescTipoFuncionario = 'VENDEDOR') then
        QNotaSaidaCons.SetVariable('COD_VENDEDOR',IntToStr(DMusuario.CodVendedorPadrao))
    end
    else
      QNotaSaidaCons.SetVariable('COD_VENDEDOR',Null);

    QNotaSaidaCons.SetVariable('DT_INICIAL',StrToDate(MEDtInicial.Text));
    QNotaSaidaCons.SetVariable('DT_FINAL',StrToDateTime(MEDtFinal.Text + ' 23:59:59'));
    QNotaSaidaCons.SetVariable('SITUACAO',FloatToStr(RGSituacao.ItemIndex));
{    QNotaSaidaCons.SQL[QNotaSaidaCons.SQL.Count-1]:='';  // elimina a última Linha da SQL
    Case RgOrdem.ItemIndex of
      0 : QNotaSaidaCons.SQL.Add('ORDER BY DT_RECEBIMENTO');
      1 : QNotaSaidaCons.SQL.Add('ORDER BY NUM_NOTA');
      2 : QNotaSaidaCons.SQL.Add('ORDER BY NOME');
    End;
}    QNotaSaidaCons.Open;
  End;
end;

procedure TFNotaSaidaCons.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    METexto.Text := DMCadastro.QCadastroConsCod_Cadastro.Text;
end;

procedure TFNotaSaidaCons.FormCreate(Sender: TObject);
begin
  inherited;
  MEDTInicial.Text := DateToStr(Date);
  MEDTFinal.Text := DateToStr(Date);
//  BtnRetorno.Visible := False;

{  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value = 'COZER' then
    BtnRetorno.Visible := True
  else
    BtnRetorno.Visible := False;
}  wRetornoCondicional := False;

  if DMParamSistema.CodEmpresa = 'CEIFAGRIL' then
  begin
    DBGrid2.Columns[0].FieldName := 'NUM_FABRICANTE';
    DBGrid2.Columns[0].Title.Caption := 'Núm.Fabricante';
    DBGrid2.Columns[0].Width := 85;
  end;
 {Alterado para trazer pelo ind_os_nota_separada da tabela param, assim não é necessário alterar toda vez que inicia um novo cliente de O.S. Alex 04/03/2026
  if (DMParamSistema.CodEmpresa = 'CENTERFRIO') or (DMParamSistema.CodEmpresa = 'NFCE-IVO')   or
     (DMParamSistema.CodEmpresa = 'MEDIPECAS')  or (DMParamSistema.CodEmpresa = 'GEOPRO')     or
     (DMParamSistema.CodEmpresa = 'BEGNINI')  	or (DMParamSistema.CodEmpresa = 'FURGOESMED') or
     (DMParamSistema.CodEmpresa = 'ZANONI') 	  or (DMParamSistema.CodEmpresa = 'JOFER')      or
     (DMParamSistema.CodEmpresa = 'MEDSYSTEM')  or (DMParamSistema.CodEmpresa = 'RRPECAS')    or
     (DMParamSistema.CodEmpresa = 'COMIN')      or (DMParamSistema.CodEmpresa = 'RSMECANICA') or
     (DMParamSistema.CodEmpresa = 'NIR') then}
  if (DMParamSistema.QParamSistemaIND_OS_NOTA_SEPARADA.Value  = 'S') then
  begin
    LbOs.Visible := True;
    MeOS.Visible := True;
//    BtOs.Visible := true;
    DBGrid1.Columns[2].Visible := true;
  end;
  if DMParamSistema.CodEmpresa = 'RETIFOZ' then
  begin
    DBGrid1.Columns.Items[5].Title.Caption := 'Total Nota';
    DbGrid1.Columns.Items[5].FieldName := 'SVAL_TOTAL_NOTA';
  end;
  if DMParamSistema.QParamSistemaIND_PAF_ECF.Value = 'S' then
    StatusBar1.Panels[0].Text := 'MENU FISCAL -> CTRL + ALT + F';
  if (DMParamSistema.QParamSistemaIND_GUIA_PAGAMENTO.Text = 'SIM') then
  begin
    DBGrid1.Columns[8].Title.Caption := 'Guia Pagto.';
    DBGrid1.Columns[8].FieldName := 'COD_GUIA_PAGAMENTO';
  end;
end;

procedure TFNotaSaidaCons.BtFilialConsClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    MeFilial.Text := DMFilial.QFilialConsCod_Filial.Text;

end;

procedure TFNotaSaidaCons.BtConsSerieClick(Sender: TObject);
begin
  inherited;
  If FSerieCons = Nil then
    FSerieCons := TFSerieCons.Create(Application);
  If FSerieCons.ShowModal = mrOk then
    MeSerie.Text := DMSerie.QSerieConsCod_Serie.Text;

end;

procedure TFNotaSaidaCons.METextoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  If Key = 123 Then //123 = F12
     BtConsCadastro.Click;
end;

procedure TFNotaSaidaCons.DSConsultaDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  DMNotaSaida.QItemNfCons.close;
  DMNotaSaida.QItemNfCons.SetVariable('Cod_Nota_Cab',DMNotaSaida.QNotaSaidaConsCod_Nota_Cab.Value);
  DMNotaSaida.QItemNfCons.Open;
end;

procedure TFNotaSaidaCons.FormActivate(Sender: TObject);
begin
  inherited;
  wRetornoCondicional := False;
end;

procedure TFNotaSaidaCons.BtnRetornoClick(Sender: TObject);
begin
  inherited;
  if(DBGrid1.DataSource.DataSet.FieldByName('IND_CONDICIONAL').Value <> 'S') then
  begin
    MessageDlg('A venda selecionada não é um condicional!', mtError, [mbOK], 0);
    ModalResult := mrNone;
  end
  else
  begin
    ModalResult := mrOk;
    wRetornoCondicional := True;
  end;
end;

procedure TFNotaSaidaCons.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if FOperacaoCons = nil then
    FOperacaoCons := TFOperacaoCons.Create(Application);
  FOperacaoCons.RGTipoOperacao.ItemIndex := 1;
  FOperacaoCons.RGTipoOperacao.Enabled := False;
  if FOperacaoCons.ShowModal = mrOK then
  Begin
    If Trim(MeOperacao.Text) <> '' Then
      MeOperacao.Text := MeOperacao.Text + ',' + DMOperacao.QOperacaoConsCOD_OPERACAO.Text
    else
      MeOperacao.Text := DMOperacao.QOperacaoConsCOD_OPERACAO.Text;
  End;

end;

procedure TFNotaSaidaCons.BtOsClick(Sender: TObject);
begin
  inherited;
  {if FOrdemServicoCons = nil then
    FOrdemServicoCons := TFOrdemServicoCons.Create(Application);
  if FOrdemServicoCons.ShowModal = mrOK then
    MeOS.Text := DMOrdemServico.QOrdemServicoConsCOD_ORDEM_SERVICO_CAB.Text;}
end;

initialization
  RegisterClass(TFNotaSaidaCons);

end.
