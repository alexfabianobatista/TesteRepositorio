unit ULivroFiscalCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Menus, Db, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, OracleNavigator;

type
  TFLivroFiscalCad = class(TFTCadSimples)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    ResumodaApuraodoImposto1: TMenuItem;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    BtRecalcula: TBitBtn;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    ApuraodoICMS1: TMenuItem;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBEdit12: TDBEdit;
    RelaoNotasPorOperao1: TMenuItem;
    ResumoNotasPorOperacao1: TMenuItem;
    Resumodasoperaesnoperiodo1: TMenuItem;
    RelaoNotasComImposto1: TMenuItem;
    ListagemNFEntradapPrefeitura1: TMenuItem;
    RelaodeNotasnoPerodo1: TMenuItem;
    DBGrid1: TDBGrid;
    LivroDFC1: TMenuItem;
    Label12: TLabel;
    DBEdit13: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    OracleNavigator1: TOracleNavigator;
    RelaoNFsPeriodo1: TMenuItem;
    procedure SBConsultaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtRecalculaClick(Sender: TObject);
    procedure ResumodaApuraodoImposto1Click(Sender: TObject);
    procedure ApuraodoICMS1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConfirmarClick(Sender: TObject);
    procedure RelaoNotasPorOperao1Click(Sender: TObject);
    procedure ResumoNotasPorOperacao1Click(Sender: TObject);
    procedure Resumodasoperaesnoperiodo1Click(Sender: TObject);
    procedure RelaoNotasComImposto1Click(Sender: TObject);
    procedure ListagemNFEntradapPrefeitura1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure RelaodeNotasnoPerodo1Click(Sender: TObject);
    procedure LivroDFC1Click(Sender: TObject);
    procedure SBExcluirClick(Sender: TObject);
    procedure RelaoNFsPeriodo1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLivroFiscalCad: TFLivroFiscalCad;

implementation

uses ULivroFiscal_Cl, ULivroFiscalCons, UOracle_cl, UUsuario_cl,
  URApuracaoResumo, UFilial_cl, UBiblioteca, UApuracaoParam,
  ULivroFiscalParam, URNotasOperacao, URNotasOperacaoResumo, ULivroFParamOp,
  URLivroFResumoOp, URLivroFResumoOpS, FResumoApuracaoParam,
  URLivroFiscalNotaImposto, UFRLivroNEPrefeitura, URLivroRel_NF_Periodo,
  URLivro_DFC, URNFEmitidas, URNotasOperacao2;

{$R *.DFM}

procedure TFLivroFiscalCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FLivroFiscalCons = Nil Then
    FLivroFiscalCons := TFLivroFiscalCons.Create(Application);
  If FLivroFiscalCons.ShowModal = mrOk Then
  With DMLivroFiscal do
    SetaRegistro( QLivroFiscalConsCod_Filial.Value,QLivroFiscalConsNum_Ano.Value,QLivroFiscalConsNum_Mes.Value);

end;

procedure TFLivroFiscalCad.FormCreate(Sender: TObject);
Var
  wAno,wMes,wDia : Word;
begin
  inherited;
  DecodeDate(DMOracle.DataServ,wAno,wMes,wDia);
  if wMes = 1 Then
  begin
    wMes := 12;
    wAno := wAno-1;
  end
  else
  begin
    wMes := wMes-1;
  end;
  DMLivroFiscal.SetaRegistro(1,wAno,wMes);
end;

procedure TFLivroFiscalCad.BtRecalculaClick(Sender: TObject);
begin
  inherited;
  DmUsuario.Checar_Filial_Usuario( Trim(DMLivroFiscal.QLivroFiscalCOD_FILIAL.Text),'LIVRO FISCAL');
  DMLivroFiscal.CalculaApuracao;
end;

procedure TFLivroFiscalCad.ResumodaApuraodoImposto1Click(Sender: TObject);
begin
  inherited;
  If FApuracaoResumoParam = Nil Then
     FApuracaoResumoParam := TFApuracaoResumoParam.Create(Application);
  FApuracaoResumoParam.PGRelatorio.Pages[0].TabVisible := True;
  if FApuracaoResumoParam.ShowModal = mrOk then
  begin
    with DMLivroFiscal do
    begin
      QResumoApuracao.Close;
      QResumoApuracao.SetVariable('FILIAL',QLivroFiscalCod_Filial.Value);
      QResumoApuracao.SetVariable('ANO',QLivroFiscalNum_Ano.Value);
      QResumoApuracao.SetVariable('MES',QLivroFiscalNum_Mes.Value);
      if QLivroFiscalNum_Mes.Value = 1 Then
      begin
        QResumoApuracao.SetVariable('ANO_ANT',QLivroFiscalNum_Ano.Value-1);
        QResumoApuracao.SetVariable('MES_ANT',12);
      end
      else
      begin
        QResumoApuracao.SetVariable('ANO_ANT',QLivroFiscalNum_Ano.Value);
        QResumoApuracao.SetVariable('MES_ANT',QLivroFiscalNum_Mes.Value-1);
      end;
      QResumoApuracao.Open;
      QRLcto.Open;
      if FRApuracaoResumo = Nil then
         FRApuracaoResumo := TFRApuracaoResumo.Create(Application);
      with DMFilial do
      begin
        QFilial.Close;
        QFilial.SetVariable('PK',QLivroFiscalCod_Filial.Value);
        QFilial.Open;
        FRApuracaoResumo.QRLNomeFilial.Caption := QFilialDesc_Filial.Value;
        FRApuracaoResumo.QRLCGCFilial.Caption := QFilialNum_CGC.Value;
        FRApuracaoResumo.QRLInscricaoFilial.Caption := QFilialDesc_Inscricao.Value;
        FRApuracaoResumo.QRLPeriodo.Caption := Bib.NomeMes(Trunc(QLivroFiscalNum_Mes.Value))+'/'+FormatFloat('0000',QLivroFiscalNum_Ano.Value);
      end;
      FRApuracaoResumo.pPaginaCorrente := Trunc( StrToFloat(FApuracaoResumoParam.ME0PaginaI.Text) );
      if FApuracaoResumoParam.RGPreview.ItemIndex = 0 then
         FRApuracaoResumo.QRPrimario.Preview
      else
         FRApuracaoResumo.QRPrimario.Print;
      if FRApuracaoResumo.pSaldoTransportar <> QLivroFiscalVal_Saldo_Credor.Value Then
      begin
        QLivroFiscal.Edit;
        QLivroFiscalVal_Saldo_Credor.Value := FRApuracaoResumo.pSaldoTransportar;
        QLivroFiscal.Post;
        DMOracle.DBCemapa.Commit;
      end;
      QRLcto.Close;
      QResumoApuracao.Close;
    end;
  end;
end;

procedure TFLivroFiscalCad.ApuraodoICMS1Click(Sender: TObject);
begin
  inherited;
  if FApuracaoParam = Nil Then
     FApuracaoParam := TFApuracaoParam.Create(Application);
  FApuracaoParam.PGRelatorio.Pages[0].TabVisible := True;
  FApuracaoParam.ShowModal;
end;

procedure TFLivroFiscalCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  If DMLivroFiscal.QLcto.State in [dsEdit,dsInsert] Then
     Raise Exception.Create('Lançamento não confirmado!');
  DMLivroFiscal.QLivroFiscal.Close;
  DMLivroFiscal.Qlcto.Close;
  Action := CaFree;
  FLivroFiscalCad := Nil;
end;

procedure TFLivroFiscalCad.SBConfirmarClick(Sender: TObject);
begin
  DmUsuario.Checar_Filial_Usuario( Trim(DMLivroFiscal.QLivroFiscalCOD_FILIAL.Text),'LIVRO FISCAL');
  inherited;
  if DMOracle.DBCemapa.InTransaction = True then
     DMOracle.DBCemapa.Commit;
end;

procedure TFLivroFiscalCad.RelaoNotasPorOperao1Click(Sender: TObject);
begin
  inherited;
  If FLivroFiscalParam = Nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[0].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME0Filial.Text),'LIVRO FISCAL');
    If FLivroFiscalParam.Rg0Ordem.ItemIndex = 0 Then
     Begin
       QRNotasOperacao.Close;
       QRNotasOperacao.SetVariable('DATA_I',FLivroFiscalParam.ME0DataI.Text);
       QRNotasOperacao.SetVariable('DATA_F',FLivroFiscalParam.ME0DataF.Text);

       If Trim(FLivroFiscalParam.ME0Filial.Text)= ''   then
         QRNotasOperacao.SetVariable('FILIAL',Null)
       Else
         QRNotasOperacao.SetVariable('FILIAL',FLivroFiscalParam.ME0Filial.Text);
       If Trim(FLivroFiscalParam.ME0Operacao.Text)= ''   then
         QRNotasOperacao.SetVariable('OPERACAO',Null)
       Else
         QRNotasOperacao.SetVariable('OPERACAO',FLivroFiscalParam.ME0Operacao.Text);
       QRNotasOperacao.Open;
       If FRNotasOperacao = Nil then
         FRNotasOperacao := TFRNotasOperacao.Create(Application);

       FRNotasOperacao.QRLTitulo.Caption := 'Notas por Operacao de '+ FLivroFiscalParam.ME0DataI.Text+' até '+FLivroFiscalParam.ME0DataF.Text;
       FRNotasOperacao.QRLFilial.Caption := 'Filial: '+ FLivroFiscalParam.Ed0Filial.Text;

       If FLivroFiscalParam.RGPreview.ItemIndex = 0 then
         FRNotasOperacao.QRPrimario.Preview
       Else
         FRNotasOperacao.QRPrimario.Print;
       QRNotasOperacao.Close;
     End
    Else
     Begin
       QRNotasOperacao2.Close;
       QRNotasOperacao2.SetVariable('DATA_I',FLivroFiscalParam.ME0DataI.Text);
       QRNotasOperacao2.SetVariable('DATA_F',FLivroFiscalParam.ME0DataF.Text);
       If Trim(FLivroFiscalParam.ME0Filial.Text)= ''   then
         QRNotasOperacao2.SetVariable('FILIAL',Null)
       Else
         QRNotasOperacao2.SetVariable('FILIAL',FLivroFiscalParam.ME0Filial.Text);
       If Trim(FLivroFiscalParam.ME0Operacao.Text)= ''   then
         QRNotasOperacao2.SetVariable('OPERACAO',Null)
       Else
         QRNotasOperacao2.SetVariable('OPERACAO',FLivroFiscalParam.ME0Operacao.Text);
       QRNotasOperacao2.Open;
       If FRNotasOperacao2 = Nil then
         FRNotasOperacao2 := TFRNotasOperacao2.Create(Application);
              FRNotasOperacao2.QRLTitulo.Caption := 'Notas por Operacao de '+ FLivroFiscalParam.ME0DataI.Text+' até '+FLivroFiscalParam.ME0DataF.Text;
       FRNotasOperacao2.QRLFilial.Caption := 'Filial: '+ FLivroFiscalParam.Ed0Filial.Text;

       If FLivroFiscalParam.RGPreview.ItemIndex = 0 then
         FRNotasOperacao2.QRPrimario.Preview
       Else
         FRNotasOperacao2.QRPrimario.Print;
       QRNotasOperacao2.Close;
     End;
  End;

end;

procedure TFLivroFiscalCad.ResumoNotasPorOperacao1Click(Sender: TObject);
begin
  inherited;
  if FLivroFiscalParam = Nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[0].TabVisible := True;
  if FLivroFiscalParam.ShowModal = mrOk then
  with DMLivroFiscal do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME0Filial.Text),'LIVRO FISCAL');
    QRNotasOperacaoResumo.Close;
    QRNotasOperacaoResumo.SetVariable('DATA_I',FLivroFiscalParam.ME0DataI.Text);
    QRNotasOperacaoResumo.SetVariable('DATA_F',FLivroFiscalParam.ME0DataF.Text);

    if Trim(FLivroFiscalParam.ME0Filial.Text)= ''   then
       QRNotasOperacaoResumo.SetVariable('FILIAL',Null)
    else
       QRNotasOperacaoResumo.SetVariable('FILIAL',FLivroFiscalParam.ME0Filial.Text);
    if Trim(FLivroFiscalParam.ME0Operacao.Text)= ''   then
       QRNotasOperacaoResumo.SetVariable('OPERACAO',Null)
    else
       QRNotasOperacaoResumo.SetVariable('OPERACAO',FLivroFiscalParam.ME0Operacao.Text);
    QRNotasOperacaoResumo.Open;
    if FRNotasOperacaoResumo = nil then
       FRNotasOperacaoResumo := TFRNotasOperacaoResumo.Create(Application);

    FRNotasOperacaoResumo.QRLTitulo.Caption := 'Resumo por Operacao de '+ FLivroFiscalParam.ME0DataI.Text+' até '+FLivroFiscalParam.ME0DataF.Text;
    FRNotasOperacaoResumo.QRLFilial.Caption := 'Filial: '+ FLivroFiscalParam.Ed0Filial.Text;

    if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
       FRNotasOperacaoResumo.QRPrimario.Preview
    else
      FRNotasOperacaoResumo.QRPrimario.Print;
    QRNotasOperacaoResumo.Close;
  end;
end;

procedure TFLivroFiscalCad.Resumodasoperaesnoperiodo1Click(
  Sender: TObject);
begin
  inherited;
  If FLivroFiscalParam = Nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[1].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  with DMLivroFiscal do
  begin
   DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME1Filial.Text),'LIVRO FISCAL');
   if FLivroFiscalParam.RG1Opcao.ItemIndex = 0 then // Escolheu analitico.
   begin
      QRLivroFResumoOpA.Close;
      QRLivroFResumoOpA.SetVariable('DATA_I',FLivroFiscalParam.ME1DataI.Text);
      QRLivroFResumoOpA.SetVariable('DATA_F',FLivroFiscalParam.ME1DataF.Text);
      if Trim(FLivroFiscalParam.ME1Filial.Text)= ''   then
         QRLivroFResumoOPA.SetVariable('FILIAL',Null)
      else
         QRLivroFResumoOPA.SetVariable('FILIAL',FLivroFiscalParam.ME1Filial.Text);
      if Trim(FLivroFiscalParam.ME1Operacao.Text)= ''   then
         QRLivroFResumoOPA.SetVariable('OPERACAO',Null)
      else
         QRLivroFResumoOPA.SetVariable('OPERACAO',FLivroFiscalParam.ME1Operacao.Text);

      QRLivroFResumoOPA.Open;
      if FRLivroFResumoOpA = Nil then
         FRLivroFResumoOpA := TFRLivroFResumoOpA.Create(Application);
      FRLivroFResumoOpA.QRLTitulo.Caption := 'Resumo por Operacao de '+ FLivroFiscalParam.ME1DataI.Text+' até '+FLivroFiscalParam.ME1DataF.Text;
      FRLivroFResumoOpA.QRLCod_Filial.Caption := FLivroFiscalParam.ME1Filial.Text;
      FRLivroFResumoOpA.QRLDesc_Filial.Caption:= FLivroFiscalParam.Ed1Filial.Text;

      if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
         FRLivroFResumoOpA.QRPrimario.Preview
      else
         FRLivroFResumoOpA.QRPrimario.Print;
      QRLivroFResumoOpA.Close;
   end
   else   {Usuario optou por SINTETICO}
     Begin
      QRLivroFResumoOpS.Close;
      QRLivroFResumoOpS.SetVariable('DATA_I',FLivroFiscalParam.ME1DataI.Text);
      QRLivroFResumoOpS.SetVariable('DATA_F',FLivroFiscalParam.ME1DataF.Text);
      if Trim(FLivroFiscalParam.ME1Filial.Text)= ''   then
         QRLivroFResumoOpS.SetVariable('FILIAL',Null)
      else
         QRLivroFResumoOpS.SetVariable('FILIAL',FLivroFiscalParam.ME1Filial.Text);
      if Trim(FLivroFiscalParam.ME1Operacao.Text)= ''   then
         QRLivroFResumoOpS.SetVariable('OPERACAO',Null)
      else
         QRLivroFResumoOpS.SetVariable('OPERACAO',FLivroFiscalParam.ME1Operacao.Text);

      QRLivroFResumoOpS.Open;
      if FRLivroFResumoOpS = Nil then
         FRLivroFResumoOpS := TFRLivroFResumoOpS.Create(Application);
         FRLivroFResumoOpS.QRLTitulo.Caption := 'Resumo por Operacao de '+ FLivroFiscalParam.ME1DataI.Text+' até '+FLivroFiscalParam.ME1DataF.Text;
         FRLivroFResumoOpS.QRLCod_Filial.Caption := FLivroFiscalParam.ME1Filial.Text;
         FRLivroFResumoOpS.QRLDesc_Filial.Caption:= FLivroFiscalParam.Ed1Filial.Text;

      if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
         FRLivroFResumoOpS.QRPrimario.Preview
      else
         FRLivroFResumoOpS.QRPrimario.Print;
      QRLivroFResumoOpS.Close;
    End;
  end;
end;

procedure TFLivroFiscalCad.RelaoNotasComImposto1Click(Sender: TObject);
begin
  inherited;
  If FLivroFiscalParam = Nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[3].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME4Filial.Text),'LIVRO FISCAL');
    QRNotasImposto.Close;
    QRNotasImposto.SetVariable('DATAI',FLivroFiscalParam.ME4DataI.Text);
    QRNotasImposto.SetVariable('DATAF',FLivroFiscalParam.ME4DataF.Text);
    If Trim(FLivroFiscalParam.ME4Filial.Text)= ''   then
      QRNotasImposto.SetVariable('FILIAL',Null)
    Else
      QRNotasImposto.SetVariable('FILIAL',FLivroFiscalParam.ME4Filial.Text);
    If Trim(FLivroFiscalParam.ME4Cadastro.Text)= ''   then
      QRNotasImposto.SetVariable('COD_CADASTRO',Null)
    Else
      QRNotasImposto.SetVariable('COD_CADASTRO',FLivroFiscalParam.ME4Cadastro.Text);
    QRNotasImposto.Open;
    If FRLivroFiscalNotasImposto = Nil then
      FRLivroFiscalNotasImposto := TFRLivroFiscalNotasImposto.Create(Application);
    FRLivroFiscalNotasImposto.QRLTitulo.Caption := 'Notas Com Imposto de '+ FLivroFiscalParam.ME4DataI.Text+' até '+FLivroFiscalParam.ME4DataF.Text;
    FRLivroFiscalNotasImposto.QRLFilial.Caption := 'Filial: '+ FLivroFiscalParam.Ed4Filial.Text;
    If FLivroFiscalParam.RGPreview.ItemIndex = 0 then
      FRLivroFiscalNotasImposto.QRPrimario.Preview
    Else
      FRLivroFiscalNotasImposto.QRPrimario.Print;
    QRNotasImposto.Close;
  End;
end;

procedure TFLivroFiscalCad.ListagemNFEntradapPrefeitura1Click(
  Sender: TObject);
begin
  inherited;
  if FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);

  FLivroFiscalParam.PGRelatorio.Pages[4].TabVisible := True;

  if FLivroFiscalParam.ShowModal = mrOK then
  with DMLivroFiscal do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME5Filial.Text),'LIVRO FISCAL');
    QRLivroNEPrefeitura.Close;
    QRLivroNEPrefeitura.SetVariable('DATA_I',FLivroFiscalParam.ME5DataI.Text);
    QRLivroNEPrefeitura.SetVariable('DATA_F',FLivroFiscalParam.ME5DataF.Text);

    if Trim(FLivroFiscalParam.ME5Filial.Text) = '' then
       QRLivroNEPrefeitura.SetVariable('FILIAL',Null)
    else
       QRLivroNEPrefeitura.SetVariable('FILIAL',FLivroFiscalParam.ME5Filial.Text);

    if Trim(FLivroFiscalParam.ME5Operacao.Text) = '' then
       QRLivroNEPrefeitura.SetVariable('OPERACAO',Null)
    else
       QRLivroNEPrefeitura.SetVariable('OPERACAO',FLivroFiscalParam.ME5Operacao.Text);

    if Trim(FLivroFiscalParam.ME5Regiao.Text) = '' then
       QRLivroNEPrefeitura.SetVariable('REGIAO',Null)
    else
       QRLivroNEPrefeitura.SetVariable('REGIAO',FLivroFiscalParam.ME5Regiao.Text);
    if Trim(FLivroFiscalParam.ME5Cadastro.Text) = '' then
       QRLivroNEPrefeitura.SetVariable('CADASTRO',Null)
    else
       QRLivroNEPrefeitura.SetVariable('CADASTRO',FLivroFiscalParam.ME5Cadastro.Text);

    QRLivroNEPrefeitura.Open;

    if FRLivroNEPrefeitura = nil then
       FRLivroNEPrefeitura := TFRLivroNEPrefeitura.Create(Application);

    FRLivroNEPrefeitura.QRLTitulo.Caption := 'N.F.Entrada no periodo: '+ FLivroFiscalParam.ME5DataI.Text+' até '+FLivroFiscalParam.ME5DataF.Text;
    FRLivroNEPrefeitura.QRLFilial.Caption := 'Filial: '+ FLivroFiscalParam.Ed5Filial.Text;
    FRLivroNEPrefeitura.QRLOperacao.Caption := 'Operação: '+Trim(FLivroFiscalParam.ME5Operacao.Text)+'-'+FLivroFiscalParam.Ed5Operacao.Text;
//    FRLivroNEPrefeitura.QRLRegiao.Caption := 'Região: '+Trim(FLivroFiscalParam.ME5Regiao.Text)+'-'+FLivroFiscalParam.Ed5Regiao.Text;

    if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
       FRLivroNEPrefeitura.QRPrimario.Preview
    else
      FRLivroNEPrefeitura.QRPrimario.Print;
    QRLivroNEPrefeitura.Close;
  end;
end;

procedure TFLivroFiscalCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(4);
end;

procedure TFLivroFiscalCad.RelaodeNotasnoPerodo1Click(Sender: TObject);
begin
  inherited;
  if FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[5].TabVisible := True;

  if FLivroFiscalParam.ShowModal = mrOK then
  with DMLivroFiscal do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME6Filial.Text),'LIVRO FISCAL');
    QRLivroRelNFPeriodo.Close;
    QRLivroRelNFPeriodo.SetVariable('DATA_I',FLivroFiscalParam.ME6DataI.Text);
    QRLivroRelNFPeriodo.SetVariable('DATA_F',FLivroFiscalParam.ME6DataF.Text);

    if Trim(FLivroFiscalParam.ME6Filial.Text) = '' then
       QRLivroRelNFPeriodo.SetVariable('COD_FILIAL',Null)
    else
       QRLivroRelNFPeriodo.SetVariable('COD_FILIAL',FLivroFiscalParam.ME6Filial.Text);

    QRLivroRelNFPeriodo.Open;

    if FRLivroRel_NF_Periodo = Nil then
      FRLivroRel_NF_Periodo := TFRLivroRel_NF_Periodo.Create(Application);
    FRLivroRel_NF_Periodo.QRLTitulo.Caption := 'Relação de Notas no Período ('+FLivroFiscalParam.ME6DataI.text+' - '+FLivroFiscalParam.ME6DataF.Text+')';
    FRLivroRel_NF_Periodo.QRLFilial.Caption := 'Filial:'+FLivroFiscalParam.Ed6Filial.text;
    if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
       FRLivroRel_NF_Periodo.QRPrimario.Preview
    else
      FRLivroRel_NF_Periodo.QRPrimario.Print;
    QRLivroRelNFPeriodo.Close;
  end;
end;

procedure TFLivroFiscalCad.LivroDFC1Click(Sender: TObject);
begin
  inherited;
  If FLivroFiscalParam = Nil then
    FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
    FLivroFiscalParam.PGRelatorio.Pages[6].TabVisible := True;
  If FLivroFiscalParam.ShowModal = mrOk then
  With DMLivroFiscal do
  Begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.ME7_Filial.Text),'LIVRO FISCAL');
    QRLivro_DFC.Close;
    if Trim(FLivroFiscalParam.ME7_Filial.Text) = '' then
      QRLivro_DFC.SetVariable('FILIAL',Null)
    else
      QRLivro_DFC.SetVariable('FILIAL',FLivroFiscalParam.ME7_Filial.Text);
    if Trim(FLivroFiscalParam.ME7_Cidade.Text) = '' then
      QRLivro_DFC.SetVariable('DESC_CIDADE',Null)
    else
      QRLivro_DFC.SetVariable('DESC_CIDADE',FLivroFiscalParam.ME7_Cidade.Text);
    if Trim(FLivroFiscalParam.ME7_Estado.Text) = '' then
      QRLivro_DFC.SetVariable('COD_ESTADO',Null)
    else
      QRLivro_DFC.SetVariable('COD_ESTADO',FLivroFiscalParam.ME7_Estado.Text);
    if Trim(FLivroFiscalParam.ME7Operacao1.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO1',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO1',FLivroFiscalParam.ME7Operacao1.Text);
    if Trim(FLivroFiscalParam.ME7Operacao2.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO2',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO2',FLivroFiscalParam.ME7Operacao2.Text);
    if Trim(FLivroFiscalParam.ME7Operacao3.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO3',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO3',FLivroFiscalParam.ME7Operacao3.Text);
    if Trim(FLivroFiscalParam.ME7Operacao4.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO4',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO4',FLivroFiscalParam.ME7Operacao4.Text);
    if Trim(FLivroFiscalParam.ME7Operacao5.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO5',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO5',FLivroFiscalParam.ME7Operacao5.Text);
    if Trim(FLivroFiscalParam.ME7Operacao6.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO6',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO6',FLivroFiscalParam.ME7Operacao6.Text);
    if Trim(FLivroFiscalParam.ME7Operacao7.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO7',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO7',FLivroFiscalParam.ME7Operacao7.Text);
    if Trim(FLivroFiscalParam.ME7Operacao8.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO8',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO8',FLivroFiscalParam.ME7Operacao8.Text);
    if Trim(FLivroFiscalParam.ME7Operacao9.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO9',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO9',FLivroFiscalParam.ME7Operacao9.Text);
    if Trim(FLivroFiscalParam.ME7Operacao10.Text) = '' then
      QRLivro_DFC.SetVariable('COD_OPERACAO10',Null)
    else
      QRLivro_DFC.SetVariable('COD_OPERACAO10',FLivroFiscalParam.ME7Operacao10.Text);
    if Trim(FLivroFiscalParam.ME7_DataI.Text) <> '' then
      QRLivro_DFC.SetVariable('DATA_I',FLivroFiscalParam.ME7_DataI.Text)
    else
      raise exception.Create('Data Inicial não pode ficar em Branco!');
    If Trim(FLivroFiscalParam.ME7_DataF.Text) <> '' then
      QRLivro_DFC.SetVariable('DATA_F',FLivroFiscalParam.ME7_DataF.Text)
    else
      raise exception.Create('Data Final não pode ficar em Branco!');
    QRLivro_DFC.Open;
    If FRLivro_DFC = Nil then
      FRLivro_DFC := TFRLivro_DFC.Create(Application);
    FRLivro_DFC.QRLTitulo.Caption := 'Livros DFC'+' - '+FLivroFiscalParam.ME7_DataI.Text+' até '+FLivroFiscalParam.ME7_DataF.Text;
    FRLivro_DFC.QRLFilial.Caption := 'Filial: '+ FLivroFiscalParam.ED7_Filial.Text;
    If FLivroFiscalParam.RGPreview.ItemIndex = 0 then
      FRLivro_DFC.QRPrimario.Preview
    Else
      FRLivro_DFC.QRPrimario.Print;
    QRLivro_DFC.Close;
  end;
end;
procedure TFLivroFiscalCad.SBExcluirClick(Sender: TObject);
begin
  inherited;
  {if not DMOracle.DBCemapa.InTransaction = false then
     DMOracle.DBCemapa.StartTransaction;

  try
    DSPrimario.DataSet.Delete;
    DMOracle.DBCemapa.Commit;
  except
    DMOracle.DBCemapa.Rollback;
    raise exception.Create('Erro na tentativa de excluir registro-LIVRO FISCAL!');
  end;
  }

end;

procedure TFLivroFiscalCad.RelaoNFsPeriodo1Click(Sender: TObject);
begin
  inherited;
  if FLivroFiscalParam = nil then
     FLivroFiscalParam := TFLivroFiscalParam.Create(Application);
  FLivroFiscalParam.PGRelatorio.Pages[7].TabVisible := True;

  if FLivroFiscalParam.ShowModal = mrOK then
  with DMLivroFiscal do
  begin
    DmUsuario.Checar_Filial_Usuario( Trim(FLivroFiscalParam.MECodFilial8.Text),'LIVRO FISCAL');
    QRNFSaida_Devolucao_Periodo.Close;
    QRNFSaida_Devolucao_Periodo.SetVariable('DT_RECEBIMENTO_I',FLivroFiscalParam.MEDataI8.Text);
    QRNFSaida_Devolucao_Periodo.SetVariable('DT_RECEBIMENTO_F',FLivroFiscalParam.MEDataF8.Text);
    if Trim(FLivroFiscalParam.MEEstado8.Text) = '' then
       QRNFSaida_Devolucao_Periodo.SetVariable('COD_ESTADO',Null)
    else
       QRNFSaida_Devolucao_Periodo.SetVariable('COD_ESTADO',FLivroFiscalParam.MEEstado8.Text);

    if Trim(FLivroFiscalParam.MECodFilial8.Text) = '' then
       QRNFSaida_Devolucao_Periodo.SetVariable('COD_FILIAL',Null)
    else
       QRNFSaida_Devolucao_Periodo.SetVariable('COD_FILIAL',FLivroFiscalParam.MECodFilial8.Text);
    QRNFSaida_Devolucao_Periodo.Open;
    if FRNF_Emitidas = nil then
       FRNF_Emitidas := TFRNF_Emitidas.Create(Application);
    FRNF_Emitidas.QRLTitulo.Caption := 'Relação de Notas no Período ('+FLivroFiscalParam.MEDataI8.text+' - '+FLivroFiscalParam.MEDataF8.Text+')';
    FRNF_Emitidas.QRLFilial.Caption := 'Filial:'+FLivroFiscalParam.EdDescFilial8.text;
    if FLivroFiscalParam.RGPreview.ItemIndex = 0 then
       FRNF_Emitidas.QRPrimario.Preview
    else
      FRNF_Emitidas.QRPrimario.Print;
    QRNFSaida_Devolucao_Periodo.Close;
  end;
end;

end.
