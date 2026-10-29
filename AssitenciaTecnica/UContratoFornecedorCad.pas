unit UContratoFornecedorCad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ImgList, DB, Menus, ComCtrls, StdCtrls, Mask,
  Buttons, ExtCtrls, DBCtrls, DBDirceu, ComObj, Grids, DBGrids,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  ActnList;

type
  TFContratoFornecedorCad = class(TFTCadSimples)
    ImpressoContrato1: TMenuItem;
    ContratoFornecedor1: TMenuItem;
    Opes1: TMenuItem;
    GeraContasaReceber1: TMenuItem;
    ReajusteMensalidade1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtConsFilial: TBitBtn;
    DBDirceu1: TDBDirceu;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtConsCliente: TBitBtn;
    DBDirceu2: TDBDirceu;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    DSContratoReajuste: TDataSource;
    DBEdit14: TDBEdit;
    Label14: TLabel;
    DBRgContrato: TDBRadioGroup;
    procedure BtConsFilialClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtConsClienteClick(Sender: TObject);
    procedure SBConsultaClick(Sender: TObject);
    procedure ImpressoContrato1Click(Sender: TObject);
    procedure ContratoFornecedor1Click(Sender: TObject);
    procedure GeraContasaReceber1Click(Sender: TObject);
    procedure ReajusteMensalidade1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoFornecedorCad: TFContratoFornecedorCad;
  WinWord, Docs, Doc: Variant;

implementation

uses UOrdemServico_cl, UFilialCons, UFilial_cl, UCadastroCons,
  UCadastro_cl, UContratoFornecedorCons, UBiblioteca, UOrdemServicoParam,
  URContratoFornecedor, UContratoFornecedor_Cp, UOracle_cl,
  UContratoFornecedorReajuste;

{$R *.dfm}

procedure TFContratoFornecedorCad.BtConsFilialClick(Sender: TObject);
begin
  inherited;
  If FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  If FFilialCons.ShowModal = mrOk then
    DMOrdemServico.QContratoFornecedorCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFContratoFornecedorCad.FormActivate(Sender: TObject);
begin
  inherited;
  DMOrdemServico.QContratoFornecedor.open;
end;

procedure TFContratoFornecedorCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMOrdemServico.QContratoFornecedor.Close;
end;

procedure TFContratoFornecedorCad.BtConsClienteClick(Sender: TObject);
begin
  inherited;
  If FCadastroCons = Nil then
    FCadastroCons := TFCadastroCons.Create(Application);
  If FCadastroCons.ShowModal = mrOk then
    DMOrdemServico.QContratoFornecedorCod_Cadastro.Value := DMCadastro.QCadastroConsCod_Cadastro.Value;
end;

procedure TFContratoFornecedorCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  if FContratoFornecedorCons = Nil then
    FContratoFornecedorCons := TFContratoFornecedorCons.Create(Application);
  if FContratoFornecedorCons.ShowModal = MrOK then
  begin
    with DMOrdemServico do
    begin
      QContratoFornecedor.Close;
      QContratoFornecedor.SetVariable('PK', QContratoFornecedorConsCOD_CONTRATO_FORNECEDOR.Value);
      QContratoFornecedor.Open;
      QContratoFornecedorReajuste.close;
      QContratoFornecedorReajuste.Open;
    end;
  end;
end;

procedure TFContratoFornecedorCad.ImpressoContrato1Click(Sender: TObject);
var
  wValor :Real;
  Path, campo :String;
begin
  inherited;

  DMFilial.QFilial.Close;
  DMFilial.QFilial.SetVariable('PK', DMOrdemServico.QContratoFornecedorCOD_FILIAL.Value);
  DMFilial.QFilial.Open;

  DMCadastro.QCadastro.close;
  DMCadastro.QCadastro.SetVariable('PK', DMOrdemServico.QContratoFornecedorCOD_CADASTRO.Value);
  DMCadastro.QCadastro.open;

  Path:=ExtractFilePath(ParamStr(0))+'Contratos\';

  // Cria objeto principal de controle
  WinWord := CreateOleObject('Word.Application');
  // Mostra o Word
  WinWord.Visible := true;
  // Pega uma interface para o objeto que manipula documentos
  Docs := WinWord.Documents;

  Doc := Docs.Open(Path+'CONTRATO FORNECEDOR.Doc');

  campo:= DMFilial.QFilialDESC_FILIAL.Text;
  Doc.Content.Find.Execute(FindText := '%filial%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMFilial.QFilialDESC_ENDERECO.Text);
  Doc.Content.Find.Execute(FindText := '%enderecoFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialNUM_ENDERECO.Text;
  Doc.Content.Find.Execute(FindText := '%numEndFilial%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMFilial.QFilialDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%cidadeFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialCOD_ESTADO.Text;
  Doc.Content.Find.Execute(FindText := '%estadoFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialNUM_CGC.Text;
  Doc.Content.Find.Execute(FindText := '%cgcFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMFilial.QFilialDESC_INSCRICAO.Text;
  Doc.Content.Find.Execute(FindText := '%inscFilial%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroNOME.Text;
  Doc.Content.Find.Execute(FindText := '%Cliente%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroNUM_INSCRICAO.Text;
  Doc.Content.Find.Execute(FindText := '%rgCliente%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMCadastro.QCadastroDESC_ENDERECO.Text);
  Doc.Content.Find.Execute(FindText := '%enderecoCliente%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMCadastro.QCadastroDESC_BAIRRO.Text);
  Doc.Content.Find.Execute(FindText := '%bairroCliente%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMCadastro.QCadastroDESC_CIDADE.Text);
  Doc.Content.Find.Execute(FindText := '%cidadeCliente%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroCOD_ESTADO.Text;
  Doc.Content.Find.Execute(FindText := '%estadoCliente%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroNUM_CGC_CPF.Text;
  Doc.Content.Find.Execute(FindText := '%cgcCliente%', ReplaceWith := campo, Replace := 2);
  campo := FormatFloat('#,##0.00',DMOrdemServico.QContratoFornecedorVAL_MENSALIDADE.Value);
  Doc.Content.Find.Execute(FindText := '%mensalidade%', ReplaceWith := campo, Replace := 2);
  wValor := DMOrdemServico.QContratoFornecedorVAL_MENSALIDADE.Value;
  campo:=Bib.extenso(wValor,'REAL');
  Doc.Content.Find.Execute(FindText := '%extenso%', ReplaceWith := campo, Replace := 2);
  campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMOrdemServico.QContratoFornecedorDT_VENDA.Value);
  Doc.Content.Find.Execute(FindText := '%dtContrato%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroDESC_TELEFONE.Text;
  Doc.Content.Find.Execute(FindText := '%telefoneCliente%', ReplaceWith := campo, Replace := 2);
  campo := DMCadastro.QCadastroDESC_CELULAR.Text;
  Doc.Content.Find.Execute(FindText := '%celularCliente%', ReplaceWith := campo, Replace := 2);
  campo:=FormatDateTime('MMMM"/"yy',DMOrdemServico.QContratoFornecedorDT_VENDA.Value);
  Doc.Content.Find.Execute(FindText := '%dtInicial%', ReplaceWith := campo, Replace := 2);
  campo:=FormatDateTime('yy',DMOrdemServico.QContratoFornecedorDT_VENDA.Value);
  wValor := StrToFloat(campo) + 1;
  campo:=FormatDateTime('MMMM',DMOrdemServico.QContratoFornecedorDT_VENDA.Value) +'/'+ FormatFloat('00',wValor);
  Doc.Content.Find.Execute(FindText := '%dtFinal%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMOrdemServico.QContratoFornecedorDESC_OBSERVACAO.Value);
  Doc.Content.Find.Execute(FindText := '%observacao%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMOrdemServico.QContratoFornecedorDESC_LOCALIZACAO.Value);
  Doc.Content.Find.Execute(FindText := '%localizacao%', ReplaceWith := campo, Replace := 2);
  campo := lowercase(DMOrdemServico.QContratoFornecedorDESC_REFERENTE.Value);
  Doc.Content.Find.Execute(FindText := '%referente%', ReplaceWith := campo, Replace := 2);

  Doc.SaveAs(Path+'Contrato_Fornecedor.Doc');

  DMFilial.QFilial.Close;
  DMCadastro.QCadastro.close;
end;

procedure TFContratoFornecedorCad.ContratoFornecedor1Click(
  Sender: TObject);
begin
  inherited;
  If FOrdemServicoParam = Nil Then
    FOrdemServicoParam := TFordemServicoParam.Create(Application);
  FOrdemServicoParam.PGRelatorio.Pages[5].TabVisible := True;
  If FOrdemServicoParam.ShowModal = mrOk Then
  With DMOrdemServico do
  Begin
    QRContratoFornecedor.Close;

    //Frames---------------------
    If Trim(FOrdemServicoParam.FmFilial6.MeFilial.Text) = '' Then
      QRContratoFornecedor.SetVariable('FILIAL',Null)
    Else
      QRContratoFornecedor.SetVariable('FILIAL',StrToFloat(Trim(FOrdemServicoParam.FmFilial6.MeFilial.Text)));
    //---------------------------
    QRContratoFornecedor.SetVariable('DT_I', FOrdemServicoParam.Me5DtInicial.Text);
    QRContratoFornecedor.SetVariable('DT_F', FOrdemServicoParam.Me5DtFinal.Text);

    Case FOrdemServicoParam.RG5Situacao.ItemIndex of
      0: QRCOntratoFornecedor.SetVariable('IND_SITUACAO','ATIVO');
      1: QRCOntratoFornecedor.SetVariable('IND_SITUACAO','INATIVO');
      2: QRCOntratoFornecedor.SetVariable('IND_SITUACAO',Null)
    end;

    QRContratoFornecedor.Open;

    If FRContratoFornecedor= Nil Then
      FRContratoFornecedor := TFRContratoFornecedor.Create(Application);
    FRContratoFornecedor.QRLTitulo.Caption:='Relatório de Contrato Fornecedor '+ FOrdemServicoParam.RG5Situacao.Items[ FOrdemServicoParam.RG5Situacao.ItemIndex];
    FRContratoFornecedor.QRLEmpresa.Caption:='Filial:'+FOrdemServicoParam.FmFilial6.EdFilial.Text;
    If FOrdemServicoParam.RGPreview.ItemIndex = 0 then
      FRContratoFornecedor.QRPrimario.Preview
    Else
      FRContratoFornecedor.QRPrimario.Print;
    QRContratoFornecedor.Close;
  End;
end;

procedure TFContratoFornecedorCad.GeraContasaReceber1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoFornecedor_Cp = Nil then
    FContratoFornecedor_Cp := TFContratoFornecedor_Cp.Create(Application);
  FContratoFornecedor_Cp.ShowModal;
end;

procedure TFContratoFornecedorCad.ReajusteMensalidade1Click(
  Sender: TObject);
begin
  inherited;
  if FContratoFornecedorReajuste = Nil then
    FContratoFornecedorReajuste := TFContratoFornecedorReajuste.Create(Application);
  FContratoFornecedorReajuste.ShowModal;
end;

procedure TFContratoFornecedorCad.PageControl1Change(Sender: TObject);
begin
  inherited;
  DMOrdemServico.QContratoFornecedorReajuste.Close;
  DMOrdemServico.QContratoFornecedorReajuste.Open;
end;

procedure TFContratoFornecedorCad.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  DMOracle.ValidaFilial(DBEdit2.Text);
end;

end.
