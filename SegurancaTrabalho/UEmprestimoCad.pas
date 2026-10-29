unit UEmprestimoCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, variants, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFEmprestimoCad = class(TFTCadSimples)
    RelaoEmprstimos1: TMenuItem;
    RelPosioEmprestimo1: TMenuItem;
    ImpEmprstimoRetornvel1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    BTFuncionarioCons: TBitBtn;
    BTProdutoCons: TBitBtn;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    BTFilialCons: TBitBtn;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    MEDt_Devolucao: TMaskEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Bevel2: TBevel;
    MEQtDevolucao: TMaskEdit;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    BTCaracteristicaCons: TBitBtn;
    DBEdit12: TDBEdit;
    DBText1: TDBText;
    Operaes1: TMenuItem;
    ConfirmarEmprstimo1: TMenuItem;
    VoltarConfirmao1: TMenuItem;
    SBPrintEmp: TSpeedButton;
    ReldeEstoque1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure BTFuncionarioConsClick(Sender: TObject);
    procedure BTProdutoConsClick(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
    procedure RelaoEmprstimos1Click(Sender: TObject);
    procedure RelPosioEmprestimo1Click(Sender: TObject);
    procedure ImpEmprstimoRetornvel1Click(Sender: TObject);
    procedure TabSheet2Show(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
    procedure BTCaracteristicaConsClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure ConfirmarEmprstimo1Click(Sender: TObject);
    procedure VoltarConfirmao1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure DBEdit9Exit(Sender: TObject);
    procedure SBPrintEmpClick(Sender: TObject);
    procedure ReldeEstoque1Click(Sender: TObject);
    procedure DBEdit1Change(Sender: TObject);
    procedure DSPrimarioDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FEmprestimoCad: TFEmprestimoCad;

implementation

uses UEmprestimo_cl, UEmprestimoCons, UFFuncionarioCons, UFuncionario_cl,
  UFilialCons, UFilial_cl, USegurancaParam,
  URRelacaoEmprestimo, URPosicaoEmprestimo, UREmprestimoRetornavel,
  UParamSistema_cl, URTermoResponsabilidade, UOracle_cl,
  UProdutoSeguranca_cl, UProdutoSegurancaCons, UCaracteristicaProdutoCons,
  UCaracteristicaProduto_cl, UEstoqueSeguranca_cl, UUsuario_cl,
  UtransfEstoqueCons, UREmprestimoNaoRetornavel, UREstoqueSeguranca;

{$R *.DFM}

procedure TFEmprestimoCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMEmprestimo.QEmprestimo.close;
  DMEmprestimo.QEmprestimo.open;
  DMEmprestimo.QEmprestimoItem.close;
  DMEmprestimo.QEmprestimoItem.open;
end;

procedure TFEmprestimoCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  if DSPrimario.State in [DSInsert,DSEdit] then
  begin
    BTFuncionarioCons.Enabled:=True;
    BTFilialCons.Enabled:=True;
    ConfirmarEmprstimo1.Enabled:=False;
    VoltarConfirmao1.Enabled:=False;
  end
  else
  begin
    BTFilialCons.Enabled:=False;
    BTFuncionarioCons.Enabled:=False;
    if DMEmprestimo.QEmprestimoInd_Situacao.Value = 'CONFIRMADO' then
    begin
      ConfirmarEmprstimo1.Enabled:=False;
      VoltarConfirmao1.Enabled:=True;
    end
    else if DMEmprestimo.QEmprestimoInd_Situacao.Value = 'DIGITADO' then
    begin
      ConfirmarEmprstimo1.Enabled:=True;
      VoltarConfirmao1.Enabled:=False;
    end
    else
    begin
      ConfirmarEmprstimo1.Enabled:=False;
      VoltarConfirmao1.Enabled:=False;
    end;
  end;
  if DSPrimario.State in [DSEdit] then
  begin
    DBEdit9.Enabled := False;
    DBRadioGroup1.Enabled := False;
  end
  else
  begin
    DBEdit9.Enabled := True;
    DBRadioGroup1.Enabled := True;
  end;
  SBPrintEmp.Enabled := VoltarConfirmao1.Enabled;
  ImpEmprstimoRetornvel1.Enabled := VoltarConfirmao1.Enabled;
end;

procedure TFEmprestimoCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FEmprestimoCons = Nil then
    FEmprestimoCons := TFEmprestimoCons.Create(Application);
  If FEmprestimoCons.ShowModal = mrOk then
  With DMEmprestimo do
  Begin
    QEmprestimo.Close;
    QEmprestimo.SetVariable('PK',QEmprestimoConsCod_Emprestimo_Cab.Value);
    QEmprestimo.Open;
  End;
end;

procedure TFEmprestimoCad.BTFuncionarioConsClick(Sender: TObject);
begin
  inherited;
  if FFuncionarioCons = nil then
    FFuncionarioCons := TFFuncionarioCons.create(application);
  if FFuncionarioCons.showmodal = mrOk then
  begin
    DMEmprestimo.QEmprestimoCod_Funcionario.Value:=DMFuncionario.QFuncionarioConsCod_Funcionario.Value;
  end;
  DBEdit2Exit(Self);
end;

procedure TFEmprestimoCad.BTProdutoConsClick(Sender: TObject);
begin
  inherited;
  if FProdutoSegurancaCons = nil then
    FProdutoSegurancaCons := TFProdutoSegurancaCons.create(application);
  if FProdutoSegurancaCons.showmodal = mrOk then
  begin
    DMEmprestimo.QEmprestimoItemCod_Produto_Seguranca.Text:=DMProdutoSeguranca.QProdutoSegurancaConsCod_Produto_Seguranca.Text;
  end;
end;

procedure TFEmprestimoCad.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = nil then
    FFilialCons := TFFilialCons.create(application);
  if FFilialCons.showmodal = mrOk then
  begin
    DMEmprestimo.QEmprestimoCod_Filial.Value:=DMFilial.QFilialConsCod_Filial.Value;
  end;
end;

procedure TFEmprestimoCad.RelaoEmprstimos1Click(Sender: TObject);
begin
  inherited;
  If FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[0].TabVisible := True;
  If FSegurancaParam.ShowModal = mrOk then
  With DMEmprestimo do
  Begin
    QRRelacaoEmprestimo.Close;
    if Trim(FSegurancaParam.ME1DtInicial.Text) = '' then
      Raise exception.Create('Data inicial dever ser Informada!');
    if Trim(FSegurancaParam.ME1DtFinal.Text) = '' then
      FSegurancaParam.ME1DtFinal.Text := DateToStr(Date);
    if Trim(FSegurancaParam.ME1CodFilial.Text)<> '' then
      QRRelacaoEmprestimo.SetVariable('COD_FILIAL',StrToInt(trim(FSegurancaParam.ME1CodFilial.Text)))
    else
      QRRelacaoEmprestimo.SetVariable('COD_FILIAL',null);

    if Trim(FSegurancaParam.ME1CodFuncionario.Text)<> '' then
      QRRelacaoEmprestimo.SetVariable('COD_FUNCIONARIO',StrToInt(trim(FSegurancaParam.ME1CodFuncionario.Text)))
    else
      QRRelacaoEmprestimo.SetVariable('COD_FUNCIONARIO',null);

    if FSegurancaParam.RG1IndRetornavel.ItemIndex = 0 then
      QRRelacaoEmprestimo.SetVariable('IND_RETORNAVEL','SIM')
    else if FSegurancaParam.RG1IndRetornavel.ItemIndex = 1 then
      QRRelacaoEmprestimo.SetVariable('IND_RETORNAVEL','NAO')
    else
      QRRelacaoEmprestimo.SetVariable('IND_RETORNAVEL',NULL);

    if FSegurancaParam.RG1Situacao.ItemIndex = 0 then
      QRRelacaoEmprestimo.SetVariable('SITUACAO','DIGITADO')
    else if FSegurancaParam.RG1Situacao.ItemIndex = 1 then
      QRRelacaoEmprestimo.SetVariable('SITUACAO','CONFIRMADO')
    else
      QRRelacaoEmprestimo.SetVariable('SITUACAO',NULL);

    QRRelacaoEmprestimo.SetVariable('DATA_I',StrToDate(FSegurancaParam.ME1DtInicial.Text));
    QRRelacaoEmprestimo.SetVariable('DATA_F',StrToDate(FSegurancaParam.ME1DtFinal.Text));

    QRRelacaoEmprestimo.Open;

    If FRRelacaoEmprestimo = Nil then
      FRRelacaoEmprestimo := TFRRelacaoEmprestimo.Create(Application);

    FRRelacaoEmprestimo.QRLTitulo.Caption := 'Relação de Empréstimo no Período De '+
                                             Trim(FSegurancaParam.ME1DtInicial.Text)+' Até '+
                                             Trim(FSegurancaParam.ME1DtFinal.Text);
    FRRelacaoEmprestimo.QRLFilial.Caption := Trim(FSegurancaParam.Ed1Filial.Text);

    If FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRRelacaoEmprestimo.QRPrimario.Preview
    else
      FRRelacaoEmprestimo.QRPrimario.print;
    QRRelacaoEmprestimo.close;
  End;
end;

procedure TFEmprestimoCad.RelPosioEmprestimo1Click(Sender: TObject);
begin
  inherited;
  If FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[1].TabVisible := True;
  If FSegurancaParam.ShowModal = mrOk then
  With DMEmprestimo do
  Begin
    if(trim(FSegurancaParam.ME2CodFilial.Text)<> '') then
      QRPosicaoEmprestimo.SetVariable('COD_FILIAL',StrToInt(trim(FSegurancaParam.ME2CodFilial.Text)))
    else
      QRPosicaoEmprestimo.SetVariable('COD_FILIAL',null);
    if trim(FSegurancaParam.ME2CodProduto.Text) <> '' then
      QRPosicaoEmprestimo.SetVariable('COD_PRODUTO',StrToInt(trim(FSegurancaParam.ME2CodProduto.Text)))
    else
      QRPosicaoEmprestimo.SetVariable('COD_PRODUTO',null);
    QRPosicaoEmprestimo.Open;

    If FRPosicaoEmprestimo = Nil then
      FRPosicaoEmprestimo := TFRPosicaoEmprestimo.Create(Application);
    FRPosicaoEmprestimo.QRLFilial.Caption := 'Filial: '+trim(FSegurancaParam.ED2DescFilial.Text);
    FRPosicaoEmprestimo.QRLProduto.Caption := 'Produto: '+trim(FSegurancaParam.ED2DescProduto.Text);
    If FSegurancaParam.RGPreview.ItemIndex = 0 then
      FRPosicaoEmprestimo.QRPrimario.Preview
    else
      FRPosicaoEmprestimo.QRPrimario.print;
    QRPosicaoEmprestimo.close;
  End;
end;

procedure TFEmprestimoCad.ImpEmprstimoRetornvel1Click(Sender: TObject);
begin
  inherited;
  SBPrintEmpClick(Self);
end;

procedure TFEmprestimoCad.TabSheet2Show(Sender: TObject);
begin
  inherited;
  with DMEmprestimo do
  begin
    //Abre a query de exibição de equipamentos que estao em poder do funcionario
    //traz equipamentos que não possuem data de Devolução
    QEquipamentoEmprestado.close;
    QEquipamentoEmprestado.setVariable('COD_EMPRESTIMO_CAB',QEmprestimoCod_Emprestimo_Cab.Value);
    QEquipamentoEmprestado.open;

    //Abre a query de exibição de Equipamentos devolvidos
    QEquipamentoDevolvido.close;
    QEquipamentoDevolvido.setVariable('COD_EMPRESTIMO_CAB',QEmprestimoCod_Emprestimo_Cab.Value);
    QEquipamentoDevolvido.open;

    MEDt_Devolucao.Text:=DateToStr(date);
  end;
end;

procedure TFEmprestimoCad.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  with DMEmprestimo do
  begin
    if DSEmprestimoItem.State in [DSEdit,DSInsert] then
      QEmprestimoItem.Post;

    if Trim(QEmprestimoInd_Situacao.Value) <> 'CONFIRMADO' then
      Raise Exception.Create('Não é Possível Efetuar Devolução - Empréstimo não Confirmado');

    QEmprestimoItem.Close;
    QEmprestimoItem.setVariable('COD_EMPRESTIMO_ITEM',QEquipamentoEmprestadoCod_Emprestimo_Item.Value);
    QEmprestimoItem.setVariable('COD_EMPRESTIMO_CAB',null);
    QEmprestimoItem.Open;
    //verifica se a quantidade devolvida não é negativa
    if StrToInt(Trim(MEQtDevolucao.Text)) <= 0 then
       Raise Exception.Create('Não é possível devolver uma quantidade negativa');
    //verifica se a quantidade que esta sendo devolvida é maior que a qtde. restante emprestada
    if QEmprestimoItemQT_EMPRESTIMO.Value < StrToInt(Trim(MEQtDevolucao.Text)) then
       Raise Exception.Create('Não é possível devolver uma quantidade maior do que a Emprestada');
    //volta quantidade devolvida ao estoque
    DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QEmprestimoCOD_FILIAL.Value,QEmprestimoItemCOD_PRODUTO_SEGURANCA.Value,
                                                QEmprestimoItemCOD_CARACTERISTICA_PRODUTO.Value,StrToFloat(Trim(MEQtDevolucao.Text)),0.0,'+');

    QEmprestimoItem.Edit;
    QEmprestimoItemDt_Devolucao.Value:=StrToDate(MEDt_Devolucao.Text);
    QEmprestimoItemQt_Emprestimo.Value:=QEmprestimoItemQt_Emprestimo.Value - StrToInt(Trim(MEQtDevolucao.Text));
    QEmprestimoItem.Post;
  end;
end;

procedure TFEmprestimoCad.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  with DMEmprestimo do
  begin
    if DSEmprestimoItem.State in [DSEdit,DSInsert] then
      QEmprestimoItem.Post;

    if Trim(QEmprestimoInd_Situacao.Value) <> 'CONFIRMADO' then
      Raise Exception.Create('Não é Possível voltar Devolução - Empréstimo não Confirmado');

    QEmprestimoItem.Close;
    QEmprestimoItem.setVariable('COD_EMPRESTIMO_ITEM',QEquipamentoDevolvidoCod_Emprestimo_Item.Value);
    QEmprestimoItem.setVariable('COD_EMPRESTIMO_CAB',null);
    QEmprestimoItem.Open;
    //verifica se a quantidade não é negativa
    if StrToInt(Trim(MEQtDevolucao.Text)) <= 0 then
       Raise Exception.Create('Não é possível voltar uma quantidade negativa');
    //verifica se a quantidade que esta sendo voltada é maior que a qtde. devolvida
    if QEmprestimoItemQT_ORIGINAL_EMPRESTIMO.Value-QEmprestimoItemQT_EMPRESTIMO.Value < StrToInt(Trim(MEQtDevolucao.Text)) then
       Raise Exception.Create('Não é possível voltar devolução de uma quantidade maior do que a Devolvida');
    //efetua baixa no estoque da quantidade voltada
    DMEstoqueSeguranca.AtualizaEstoqueSeguranca(QEmprestimoCOD_FILIAL.Value,QEmprestimoItemCOD_PRODUTO_SEGURANCA.Value,
                                                QEmprestimoItemCOD_CARACTERISTICA_PRODUTO.Value,StrToFloat(Trim(MEQtDevolucao.Text)),0.0,'-');
    QEmprestimoItem.Edit;
    if QEmprestimoItemQT_ORIGINAL_EMPRESTIMO.Value = QEmprestimoItemQT_EMPRESTIMO.Value+StrToInt(Trim(MEQtDevolucao.Text)) then
      QEmprestimoItemDt_Devolucao.Text:='';
    QEmprestimoItemQt_Emprestimo.Value:=QEmprestimoItemQt_Emprestimo.Value + StrToInt(Trim(MEQtDevolucao.Text));
    QEmprestimoItem.Post;
  end;
end;

procedure TFEmprestimoCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  if Trim (DMEmprestimo.QEmprestimoCOD_FUNCIONARIO.Text) <> '' then
    DMEmprestimo.QEmprestimoCOD_Filial.Text:=DMOracle.BuscaNome(
    'SELECT COD_FILIAL FROM TB_FUNCIONARIO','COD_FUNCIONARIO= '+Trim (DMEmprestimo.QEmprestimoCOD_Funcionario.Text));
  if Trim(DMEmprestimo.QEmprestimoCOD_Filial.Text) <> '' then
     DBEdit9Exit(Self);
end;

procedure TFEmprestimoCad.BTCaracteristicaConsClick(Sender: TObject);
begin
  inherited;
  if FCaracteristicaProdutoCons = nil then
    FCaracteristicaProdutoCons := TFCaracteristicaProdutoCons.create(application);
  if FCaracteristicaProdutoCons.showModal = mrOk then
  begin
    DMEmprestimo.QEmprestimoItemCod_Caracteristica_Produto.Text:=DMCaracteristicaProduto.QCaracteristicaProdutoConsCod_Caracteristica_Produto.Text;
  end;
end;

procedure TFEmprestimoCad.TabSheet1Show(Sender: TObject);
begin
  inherited;
  with DMEmprestimo do
  begin
    QEmprestimoItem.Close;
    QEmprestimoItem.setVariable('COD_EMPRESTIMO_ITEM',Null);
    QEmprestimoItem.setVariable('COD_EMPRESTIMO_CAB',QEquipamentoEmprestadoCod_Emprestimo_Cab.Value);
    QEmprestimoItem.Open;
  end;
end;

procedure TFEmprestimoCad.ConfirmarEmprstimo1Click(Sender: TObject);
begin
  inherited;
  if DMEmprestimo.QEmprestimoInd_Situacao.Value = 'CONFIRMADO' then
    Raise Exception.Create('Empréstimo já Confirmado');
  DMEmprestimo.QEmprestimo.Edit;
  DMEmprestimo.QEmprestimoIND_SITUACAO.Text := 'CONFIRMADO';
  DMEmprestimo.QEmprestimo.Post;
end;

procedure TFEmprestimoCad.VoltarConfirmao1Click(Sender: TObject);
var
  wQtOrigEmp, wQtEmp: Integer;
begin
  inherited;
  if DMEmprestimo.QEmprestimoInd_Situacao.Value = 'DIGITADO' then
    Raise Exception.Create('Empréstimo não Confirmado');

  try
    wQtOrigEmp := StrToInt(Trim(DMOracle.BuscaNome('SELECT SUM(QT_ORIGINAL_EMPRESTIMO) FROM TB_EMPRESTIMO_ITEM',
                                                   'COD_EMPRESTIMO_CAB = '+DMEmprestimo.QEmprestimoCOD_EMPRESTIMO_CAB.Text)));
    wQtEmp := StrToInt(Trim(DMOracle.BuscaNome('SELECT SUM(QT_EMPRESTIMO) FROM TB_EMPRESTIMO_ITEM',
                                               'COD_EMPRESTIMO_CAB = '+DMEmprestimo.QEmprestimoCOD_EMPRESTIMO_CAB.Text)));
  except
  end;
  if wQtOrigEmp <> wQtEmp then
    Raise Exception.Create('Não é possível voltar um emprésimo com Quantidade Devolvida');
  DMOracle.DBCemapa.StartTransaction;
  DMOracle.QExecSQL.Close;
  DMOracle.QExecSQL.SQL.Clear;
  DMOracle.QExecSQL.SQL.Add('UPDATE TB_EMPRESTIMO_CAB ');
  DMOracle.QExecSQL.SQL.Add('SET IND_SITUACAO = '+CHR(39)+'DIGITADO'+CHR(39));
  DMOracle.QExecSQL.SQL.Add('WHERE COD_EMPRESTIMO_CAB = '+DMEmprestimo.QEmprestimoCOD_EMPRESTIMO_CAB.Text);
  DMOracle.QExecSQL.ExecSQL;
  DMOracle.DBCemapa.Commit;
  DMEmprestimo.QEmprestimo.RefreshRecord;
  DSPrimarioStateChange(Self);
end;

procedure TFEmprestimoCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(8);
end;

procedure TFEmprestimoCad.DBEdit9Exit(Sender: TObject);
begin
  inherited;
  //caso usuário náo for privilegiado
  //valida sua filial
  if DMUsuario.Privilegiado = False then
  begin
    if DMUsuario.CodFilialUsuario <> StrToInt(DBEdit9.Text) then
    begin
      DMEmprestimo.QEmprestimoCOD_FUNCIONARIO.Clear;
      DMEmprestimo.QEmprestimoCOD_FILIAL.Clear;
      Raise Exception.Create('Usuário não possui permissão para realizar a Operação');
    end;
  end;
end;

procedure TFEmprestimoCad.SBPrintEmpClick(Sender: TObject);
begin
  inherited;
  with DMEmprestimo do
  begin
    if Trim(QEmprestimoCOD_EMPRESTIMO_CAB.Text) = '' then
      raise Exception.Create('O Empréstimo deve ser informado');
    if Trim(QEmprestimoIND_SITUACAO.Value) <> 'CONFIRMADO' then
      Raise Exception.Create('O Empréstimo deve ser Confirmado antes de ser Impresso');
    //verifica o tipo do empréstimo
    if Trim(QEmprestimoIND_RETORNAVEL.Value) = 'NAO' then
    begin
      QREmprestimoNaoRetornavel.Close;
      QREmprestimoNaoRetornavel.SetVariable('COD_EMPRESTIMO',QEmprestimoCOD_EMPRESTIMO_CAB.Text);
      QREmprestimoNaoRetornavel.Open;
      if FREmprestimoNaoRetornavel = nil then
        FREmprestimoNaoRetornavel := TFREmprestimoNaoRetornavel.Create(Application);
      FREmprestimoNaoRetornavel.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Value;
      FREmprestimoNaoRetornavel.QRLLocalData.Caption := QREmprestimoNaoRetornavelDESC_CIDADE.text + FormatDateTime(', dd "de" mmmm "de" yyyy',QREmprestimoNaoRetornavelDT_EMPRESTIMO.Value);
      FREmprestimoNaoRetornavel.QRPrimario.Preview;  //aqui
      QREmprestimoNaoRetornavel.close;
    end
    else
    begin
      QREmprestimoRetornavel.Close;
      QREmprestimoRetornavel.SetVariable('COD_EMPRESTIMO',QEmprestimoCOD_EMPRESTIMO_CAB.Text);
      QREmprestimoRetornavel.Open;
      if FREmprestimoRetornavel = nil then
        FREmprestimoRetornavel := TFREmprestimoRetornavel.Create(Application);
      FREmprestimoRetornavel.QRLEmpresa.Caption := DMParamSistema.QParamSistemaDESC_EMPRESA.Value;
      FREmprestimoRetornavel.QRLLocalData.Caption := QREmprestimoRetornavelDESC_CIDADE.text + FormatDateTime(', dd "de" mmmm "de" yyyy',QREmprestimoRetornavelDT_EMPRESTIMO.Value);
      FREmprestimoRetornavel.QRPrimario.Preview;  //aqui
      if FRTermoResponsabilidade = nil then
        FRTermoResponsabilidade := TFRTermoResponsabilidade.Create(Application);
      //FRTermoResponsabilidade.QRLFuncionario.Caption:=DMOracle.BuscaNome('SELECT DESC_FUNCIONARIO FROM TB_FUNCIONARIO','COD_FUNCIONARIO = '+Trim(QREmprestimoRetornavelCOD_FUNCIONARIO.Text));
      FRTermoResponsabilidade.QRLCidade.Caption := QREmprestimoRetornavelDESC_CIDADE.text + FormatDateTime(', dd "de" mmmm "de" yyyy',QREmprestimoRetornavelDT_EMPRESTIMO.Value);
      FRTermoResponsabilidade.QRPrimario.Preview; //aqui
      QREmprestimoRetornavel.close;
    end;
  end;
end;

procedure TFEmprestimoCad.ReldeEstoque1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = Nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[9].TabVisible := True;
  if FSegurancaParam.ShowModal = mrOk then
  with DMEstoqueSeguranca do
  begin
    QREstoqueSeguranca.Close;

    if(Trim(FSegurancaParam.ME10Filial.Text)<> '') then
      QREstoqueSeguranca.SetVariable('COD_FILIAL',StrToInt(Trim(FSegurancaParam.ME10Filial.Text)))
    else
      QREstoqueSeguranca.SetVariable('COD_FILIAL',Null);

    if Trim(FSegurancaParam.ME10Produto.Text) <> '' then
      QREstoqueSeguranca.SetVariable('COD_PRODUTO',StrToInt(Trim(FSegurancaParam.ME10Produto.Text)))
    else
      QREstoqueSeguranca.SetVariable('COD_PRODUTO',Null);

    QREstoqueSeguranca.Open;

    if FREstoqueSeguranca = nil then
      FREstoqueSeguranca := TFREstoqueSeguranca.Create(Application);
    FREstoqueSeguranca.QRLFilial.Caption :='Filial: '+FSegurancaParam.Ed10Filial.Text;

    if FSegurancaParam.RGPreview.ItemIndex = 0 then
      FREstoqueSeguranca.QRPrimario.Preview
    else
      FREstoqueSeguranca.QRPrimario.print;
    FREstoqueSeguranca.Close;
  end;
end;

procedure TFEmprestimoCad.DBEdit1Change(Sender: TObject);
begin
  inherited;
  DSPrimarioStateChange(Self);
end;

procedure TFEmprestimoCad.DSPrimarioDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  with DMEmprestimo.QEmprestimoIND_SITUACAO do
    if Value = 'DIGITADO' then
      DBText1.Font.Color := clRed
    else
      DBText1.Font.Color := clGreen;
end;

end.
