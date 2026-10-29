unit UContratoMensalCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, ExtCtrls, DBCtrls, ImgList, Db, Menus,
  ComCtrls, Mask, variants, OleServer, Word2000, ComObj, Grids, DBGrids,
  DBDirceu, ActnList, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP;

type
  TFContratoMensalCad = class(TFTCadSimples)
    Opes1: TMenuItem;
    GeraContasReceber1: TMenuItem;
    ContratoMensal1: TMenuItem;
    ImpressoContrato1: TMenuItem;
    ReajusteMensalidade1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtConsFilial: TBitBtn;
    DBEdit10: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtConsCadastro: TBitBtn;
    DBEdit11: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBEdit16: TDBEdit;
    Label12: TLabel;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    DSContratoReajuste: TDataSource;
    DBEdit17: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    SbBuscaTipoContrato: TSpeedButton;
    DBDirceu1: TDBDirceu;
    DBCBFormaPagto: TDBComboBox;
    lblFormaPagto: TLabel;
    DBCBContratoInternet: TDBComboBox;
    lblContratoInternet: TLabel;
    Label17: TLabel;
    DBEdit19: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    BtCadastroParceiro: TBitBtn;
    DBEdit21: TDBEdit;
    Label19: TLabel;
    DBEdit22: TDBEdit;
    procedure BtConsFilialClick(Sender: TObject);
    procedure BtConsCadastroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure GeraContasReceber1Click(Sender: TObject);
    procedure ContratoMensal1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure ImpressoContrato1Click(Sender: TObject);
    procedure ReajusteMensalidade1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SbBuscaTipoContratoClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBIncluirClick(Sender: TObject);
    procedure BtCadastroParceiroClick(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoMensalCad: TFContratoMensalCad;
  WinWord, Docs, Doc: Variant;
implementation

uses UOrdemServico_cl, UFilialCons, UCadastroCons, UFilial_cl, UCadastro_cl,
  UContratoMensalCons, UContratoMensal_Rec, UOrdemServicoParam,
  UROrdemServico_Sintetico, URContratoMensal, UBiblioteca, UOracle_cl,
  UContratoMensalReajuste, UTipoContratoCons, UTipoContrato_cl,
  UParamSistema_cl;

{$R *.DFM}

procedure TFContratoMensalCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMOrdemServico.QContratoMensalCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;

end;

procedure TFContratoMensalCad.BtConsCadastroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMOrdemServico.QContratoMensalCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;

end;

procedure TFContratoMensalCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DMOrdemServico do
  Begin
    QContratoMensal.Open;
  End;
  if DMParamSistema.CodEmpresa <> 'NIR' then
  begin
    DBEdit22.Visible := false;
    Label19.Visible := false;
  end;
  If DmParamSistema.CodEmpresa = 'INNET' Then
  begin
//    lblFormaPagto.Visible        := true;
    lblContratoInternet.Visible  := true;
//    DBCBFormaPagto.Visible       := true;
    DBCBContratoInternet.Visible := true;
  end;
  If DmParamSistema.CodEmpresa = 'NIR' Then
  begin
    DBCBFormaPagto.Clear;
    DBCBFormaPagto.Items.Add('Mensal');
    DBCBFormaPagto.Items.Add('Anual');
  end;

end;

procedure TFContratoMensalCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FContratoMensalCons = Nil then
    FContratoMensalCons := TFContratoMensalCons.Create(Application);
  If FContratoMensalCons.ShowModal = mrOk then
  With DMOrdemServico do
  Begin
    QContratoMensal.Close;
    QContratoMensal.SetVariable('PK',QContratoMensalConsCod_Contrato_Mensal.Value);
    QContratoMensal.Open;
    QContratoMensalReajuste.close;
    QContratoMensalReajuste.open;
  End;

end;

procedure TFContratoMensalCad.GeraContasReceber1Click(Sender: TObject);
begin
  inherited;
  If FContratoMensal_Rec = Nil Then
     FContratoMensal_Rec := TFContratoMensal_Rec.Create(Application);
  FContratoMensal_Rec.ShowModal;

end;

procedure TFContratoMensalCad.ContratoMensal1Click(Sender: TObject);
begin
  inherited;
  If FOrdemServicoParam = Nil Then
     FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[4].TabVisible := True;
  If FOrdemServicoParam.ShowModal = mrOk Then
  With DMOrdemServico do
  Begin
    QRContratoMensal.Close;
    //Frames--------
    If Trim(FOrdemServicoParam.FmFilial5.MeFilial.Text) = '' Then
      QRContratoMensal.SetVariable('FILIAL',Null)
    Else
      QRContratoMensal.SetVariable('FILIAL',StrToFloat(Trim(FOrdemServicoParam.FmFilial5.MeFilial.Text)));
    If Trim(FOrdemServicoParam.FmCadastro3.MeCadastro.Text) = '' Then
      QRContratoMensal.SetVariable('CADASTRO_PARCEIRO',Null)
    Else
      QRContratoMensal.SetVariable('CADASTRO_PARCEIRO',StrToFloat(Trim(FOrdemServicoParam.FmCadastro3.MeCadastro.Text)));
    //--------------
    QRContratoMensal.SetVariable('DT_I', FOrdemServicoParam.Me4DtInicial.Text);
    QRContratoMensal.SetVariable('DT_F', FOrdemServicoParam.Me4DtFinal.Text);

    Case FOrdemServicoParam.RG4Situacao.ItemIndex of
      0: QRCOntratoMensal.SetVariable('IND_SITUACAO','ATIVO');
      1: QRCOntratoMensal.SetVariable('IND_SITUACAO','INATIVO');
      2: QRCOntratoMensal.SetVariable('IND_SITUACAO',Null)
    end;

    Case FOrdemServicoParam.RG4Cobranca.ItemIndex of
      0: QRCOntratoMensal.SetVariable('DESC_FORMA_PAGTO','ANUAL');
      1: QRCOntratoMensal.SetVariable('DESC_FORMA_PAGTO','MENSAL');
      2: QRCOntratoMensal.SetVariable('DESC_FORMA_PAGTO',Null)
    end;
    QRCOntratoMensal.SQL[QRCOntratoMensal.SQL.Count - 1] := ''; //SERVE PARA EXCUIR A ULTIMA LINHA DA SQL NA QUERY
    if FOrdemServicoParam.CB4Ordem.itemIndex = 0 then
      QRCOntratoMensal.Sql.Add(' ORDER BY TB_CADASTRO.COD_CADASTRO')
    else
      QRCOntratoMensal.Sql.Add(' ORDER BY TB_CADASTRO.NOME');

    QRContratoMensal.Open;

    If FRContratoMensal= Nil Then
       FRContratoMensal := TFRContratoMensal.Create(Application);
    FRContratoMensal.QRLTitulo.Caption:='Relatório de Contrato Mensal '+ FOrdemServicoParam.RG4Situacao.Items[ FOrdemServicoParam.RG4Situacao.ItemIndex];
    FRContratoMensal.QRLEmpresa.Caption:='Filial:'+FOrdemServicoParam.FmFilial5.EdFilial.Text;
    FRContratoMensal.QRLParceiro.Caption := 'Parceiro: ' + Trim(FOrdemServicoParam.FmCadastro3.MeCadastro.Text) + ' - ' + FOrdemServicoParam.FmCadastro3.EdCadastro.Text;
    If FOrdemServicoParam.RGPreview.ItemIndex = 0 then
      FRContratoMensal.QRPrimario.Preview
    Else
      FRContratoMensal.QRPrimario.Print;
    QRContratoMensal.Close;
  End;
end;
procedure TFContratoMensalCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext (10);
end;

procedure TFContratoMensalCad.ImpressoContrato1Click(Sender: TObject);
var
  Path, campo :String;
  wValor :Real;
  wTamanho, i :Integer;
begin
  inherited;

  if DMOrdemServico.QContratoMensal.RecordCount = 0 then
    Raise Exception.Create('Nenhum contrato foi selecionado');

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMOrdemServico.QContratoMensalCOD_FILIAL.Value);
  DMFilial.QFilial.Open;

  DMCadastro.QCadastro.close;
  DMCadastro.QCadastro.SetVariable('PK', DMOrdemServico.QContratoMensalCOD_CADASTRO.Value);
  DMCadastro.QCadastro.open;

  with DMTipoContrato do
  begin
    QTipoContrato.Close;
    QTipoContrato.SetVariable('PK', DMOrdemServico.QContratoMensalCOD_TIPO_CONTRATO.Value);
    QTipoContrato.Open;
  end;

  Path:=ExtractFilePath(ParamStr(0))+'Contratos\';

  // Cria objeto principal de controle
  WinWord := CreateOleObject('Word.Application');
  // Mostra o Word
  WinWord.Visible := true;
  // Pega uma interface para o objeto que manipula documentos
  Docs := WinWord.Documents;

  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INNET' then
    Doc := Docs.Open(Path+'CONTRATO CLIENTE.Doc')
  else
  begin
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'ASSISTENCIA' then
      Doc := Docs.Open(Path+'CONTRATO ASSISTENCIA.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'ADSL' then
      Doc := Docs.Open(Path+'CONTRATO ADSL.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'DISCADO' then
      Doc := Docs.Open(Path+'CONTRATO DISCADO.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'HOSPEDAGEM' then
      Doc := Docs.Open(Path+'CONTRATO HOSPEDAGEM.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'VIA RADIO' then
      Doc := Docs.Open(Path+'CONTRATO VIA RADIO.Doc');
  end;

  campo:= DMOrdemServico.QContratoMensalNUM_CONTRATO_MENSAL.Text;
  Doc.Content.Find.Execute(FindText := '%num_contrato%', ReplaceWith := campo, Replace := 2);
  campo:= DMFilial.QFilialDESC_FILIAL.Text;
  Doc.Content.Find.Execute(FindText := '%filial%', ReplaceWith := campo, Replace := 2);
  campo := Lowercase(DMFilial.QFilialDESC_ENDERECO.Text);
  Doc.Content.Find.Execute(FindText := '%enderecoFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialNUM_ENDERECO.Text;
  Doc.Content.Find.Execute(FindText := '%numEndFilial%', ReplaceWith := campo, Replace := 2);
  campo := Lowercase(DMFilial.QFilialDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%cidadeFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialDESC_TELEFONE.Text;
  Doc.Content.Find.Execute(FindText := '%telefoneFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialCOD_ESTADO.Text;
  Doc.Content.Find.Execute(FindText := '%estadoFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialNUM_CGC.Text;
  Doc.Content.Find.Execute(FindText := '%cgcFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialDESC_CEP.Text;
  Doc.Content.Find.Execute(FindText := '%cepFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroNOME.Text;
  Doc.Content.Find.Execute(FindText := '%cliente%', ReplaceWith := campo, Replace := 2);
  campo := Lowercase(DMCadastro.QCadastroDESC_ENDERECO.Text);
  Doc.Content.Find.Execute(FindText := '%enderecoCliente%', ReplaceWith := campo, Replace := 2);
  campo := Lowercase(DMCadastro.QCadastroDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%cidadeCliente%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroCOD_ESTADO.Text;
  Doc.Content.Find.Execute(FindText := '%estadoCliente%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroNUM_CGC_CPF.Text;
  Doc.Content.Find.Execute(FindText := '%cgcCliente%', ReplaceWith := campo, Replace := 2);
  campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMOrdemServico.QContratoMensalDT_VENDA.Value);
  Doc.Content.Find.Execute(FindText := '%dtVenda%', ReplaceWith := campo, Replace := 2);
  campo := LowerCase(DMCadastro.QCadastroDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%localInstalacao%', ReplaceWith := campo, Replace := 2);
  campo := FormatFloat('#,##0.00',DMOrdemServico.QContratoMensalVAL_MENSALIDADE.Value);
  Doc.Content.Find.Execute(FindText := '%mensalidade%', ReplaceWith := campo, Replace := 2);
  wValor := DMOrdemServico.QContratoMensalVAL_MENSALIDADE.Value;
  campo:=Bib.extenso(wValor,'REAL');
  Doc.Content.Find.Execute(FindText := '%extenso%', ReplaceWith := campo, Replace := 2);
  campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMOrdemServico.QContratoMensalDT_INICIO_COBRANCA.Value);
  Doc.Content.Find.Execute(FindText := '%dtInicio%', ReplaceWith := campo, Replace := 2);
  campo := Lowercase(DMFilial.QFilialDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%cidadeForum%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialCOD_ESTADO.Text;
  Doc.Content.Find.Execute(FindText := '%estadoForum%', ReplaceWith := campo, Replace := 2);
  campo := Lowercase(DMFilial.QFilialDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%cidadeContrato%', ReplaceWith := campo, Replace := 2);
  campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMOrdemServico.QContratoMensalDT_VENDA.Value);
  Doc.Content.Find.Execute(FindText := '%dtContrato%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroNOME.Text;
  Doc.Content.Find.Execute(FindText := '%nomeCliente%', ReplaceWith := campo, Replace := 2);
  campo:= DMFilial.QFilialDESC_FILIAL.Text;
  Doc.Content.Find.Execute(FindText := '%nomeFilial%', ReplaceWith := campo, Replace := 2);
  campo:= Lowercase(DMOrdemServico.QContratoMensalDESC_REFERENTE.Text);
  Doc.Content.Find.Execute(FindText := '%referente%', ReplaceWith := campo, Replace := 2);
  campo := LowerCase(DMOrdemServico.QContratoMensalDESC_OBSERVACAO.Text);
  Doc.Content.Find.Execute(FindText := '%observacao%', ReplaceWith := campo, Replace := 2);
  campo:= Lowercase(DMOrdemServico.QContratoMensalNUM_PRAZO.Text);
  Doc.Content.Find.Execute(FindText := '%prazo%', ReplaceWith := campo, Replace := 2);
  campo:=Bib.extenso(DMOrdemServico.QContratoMensalNUM_PRAZO.Value,'Real');
  wTamanho := Length(campo);
  i := 1;
  while i <= wTamanho do
  begin
    if campo[i] = 'R' then
    begin
      if (copy(campo,i,4) = 'Real') or (copy(campo,i,5) = 'Reais') then
      begin
        while i <= wTamanho do
        begin
          campo[i] := ' ';
          Inc(i);
        end;
        Break;
      end;
    end;
    Inc(i);
  end;
  Doc.Content.Find.Execute(FindText := '%prazoExtenso%', ReplaceWith := campo, Replace := 2);
  campo:= Lowercase(DMOrdemServico.QContratoMensalDESC_LOCALIZACAO.Text);
  Doc.Content.Find.Execute(FindText := '%localizacao%', ReplaceWith := campo, Replace := 2);
  campo := DMTipoContrato.QTipoContratoDESC_TIPO_CONTRATO.Value;
  Doc.Content.Find.Execute(FindText := '%tipoContrato%', ReplaceWith := campo, Replace := 2);
  campo := DMTipoContrato.QTipoContratoVAL_MENSAL.Text;
  Doc.Content.Find.Execute(FindText := '%valMensalContrato%', ReplaceWith := campo, Replace := 2);


  if DMParamSistema.QParamSistemaCOD_EMPRESA.Value <> 'INNET' then
    Doc.SaveAs(Path+'Contrato_Cliente.Doc')
  else
  begin
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'ASSISTENCIA' then
      Doc.SaveAs(Path+'Contrato_Assistencia.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'ADSL' then
      Doc.SaveAs(Path+'Contrato_Adsl.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'DISCADO' then
      Doc.SaveAs(Path+'Contrato_Discado.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'HOSPEDAGEM' then
      Doc.SaveAs(Path+'Contrato_Hospedagem.Doc');
    if DMOrdemServico.QContratoMensalDESC_CONTRATO_INTERNET.Value = 'VIA RADIO' then
      Doc.SaveAs(Path+'Contrato_Via_Radio.Doc');
  end;


  DMFilial.QFilial.Close;
  DMCadastro.QCadastro.close;

end;
procedure TFContratoMensalCad.ReajusteMensalidade1Click(Sender: TObject);
begin
  inherited;
  if FContratoMensalReajuste = Nil then
    FContratoMensalReajuste := TFContratoMensalReajuste.Create(Application);
  FContratoMensalReajuste.ShowModal;
end;

procedure TFContratoMensalCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  DMOrdemServico.QContratoMensalReajuste.Close;
  DMOrdemServico.QContratoMensalReajuste.Open;
end;

procedure TFContratoMensalCad.SbBuscaTipoContratoClick(Sender: TObject);
begin
  inherited;
  if FTipoContratoCons = Nil then
    FTipoContratoCons := TFTipoContratoCons.Create(Application);
  if FTipoContratoCons.ShowModal = MrOk then
    DMOrdemServico.QContratoMensalCOD_TIPO_CONTRATO.Value := DMTipoContrato.QTipoContratoConsCOD_TIPO_CONTRATO.Value;
end;

procedure TFContratoMensalCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.DataSet.State in [DSInsert, DSEdit] then
  begin
    SbBuscaTipoContrato.Enabled  := true;
    BtConsFilial.Enabled         := true;
    BtConsCadastro.Enabled       := true;
    DBCBFormaPagto.Enabled       := true;
    DBCBContratoInternet.Enabled := true;
  end
  else
    begin
      SbBuscaTipoContrato.Enabled  := false;
      BtConsFilial.Enabled         := false;
      BtConsCadastro.Enabled       := false;
      DBCBFormaPagto.Enabled       := false;
      DBCBContratoInternet.Enabled := false;
    end;
end;

procedure TFContratoMensalCad.SBIncluirClick(Sender: TObject);
begin
  inherited;
  DBCBFormaPagto.ItemIndex       := 0;
  DBCBContratoInternet.ItemIndex := 0;
end;

procedure TFContratoMensalCad.BtCadastroParceiroClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMOrdemServico.QContratoMensalCod_Cadastro_Parceiro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoMensalCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
