unit UContratoLocatario_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, DBCtrls, ComObj, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFContratoLocatario_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBRadioGroup1: TDBRadioGroup;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Opo1: TMenuItem;
    GerarContasPagar1: TMenuItem;
    EmissoContrato1: TMenuItem;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Extrato1: TMenuItem;
    RelatrioComissoImobiliria1: TMenuItem;
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure GerarContasPagar1Click(Sender: TObject);
    procedure EmissoContrato1Click(Sender: TObject);
    procedure Extrato1Click(Sender: TObject);
    procedure RelatrioComissoImobiliria1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoLocatario_Cad: TFContratoLocatario_Cad;
  WinWord, Docs, Doc: Variant;

implementation

uses UImobiliaria_cl, UImovel_Cons, UFilialCons, UContratoLocatario_Cons,
  UContaPagarLocatario, UFilial_cl, UCadastro_cl, UOracle_cl, uBiblioteca,
  UImobiliaria_Param, UrImobiliaria_Extrato, UrComissaoImobiliaria;

{$R *.dfm}

procedure TFContratoLocatario_Cad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FImovel_Cons;
  Classe := TFImovel_Cons;

end;

procedure TFContratoLocatario_Cad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;

end;

procedure TFContratoLocatario_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QLocatario_Cad.Open;
end;

procedure TFContratoLocatario_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMImobiliaria.QLocatario_Cad.Close;
end;

procedure TFContratoLocatario_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;

  If FContratoLocatario_Cons = Nil then
    FContratoLocatario_Cons := TFContratoLocatario_Cons.Create(Application);
  If FContratoLocatario_Cons.ShowModal = mrOk then
  With DMImobiliaria do
  Begin
    QLocatario_Cad.Close;
    QLocatario_Cad.SetVariable('PK',QLocatario_ConsCod_Contrato_Locatario.Value);
    QLocatario_Cad.Open;
  End;

end;

procedure TFContratoLocatario_Cad.GerarContasPagar1Click(Sender: TObject);
begin
  inherited;
  If FContaPagarLocatario = Nil then
    FContaPagarLocatario := TFContaPagarLocatario.Create(Application);
  FContaPagarLocatario.ShowModal;

end;

procedure TFContratoLocatario_Cad.EmissoContrato1Click(Sender: TObject);
var Path, campo : String;
begin
  inherited;
  if DMImobiliaria.QLocatario_CadCOD_CONTRATO_LOCATARIO.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMImobiliaria.QLocatario_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMImobiliaria.QImovel_Cad.Close;
      DMImobiliaria.QImovel_Cad.SetVariable('PK',DMImobiliaria.QLocatario_CadCOD_IMOVEL.Value);
      DMImobiliaria.QImovel_Cad.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMImobiliaria.QImovel_CadCOD_PROPRIETARIO.Value);
      DMCadastro.QCadastro.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'Contrato_opção_locação.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_contratante',ReplaceWith := campo,Replace:=2);
      If DMCadastro.QCadastroCod_Estado_Civil.Text <> '' Then
         campo := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL = '+DMCadastro.QCadastroCod_Estado_Civil.Text)
      Else
         campo := ' ';
      Doc.Content.Find.Execute(FindText := '%estado_civil_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%profissao_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_contratante',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroNome_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%esposa_contratante',ReplaceWith := campo,Replace:=2);
      If DMCadastro.QCadastroCod_Estado_Civil.Text <> '' Then
         campo := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL = '+DMCadastro.QCadastroCod_Estado_Civil.Text)
      Else
         campo := ' ';
      Doc.Content.Find.Execute(FindText := '%est_civil_esposa',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Identidade_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%rg_esposa_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cpf_Conjuge.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_esposa_contratante',ReplaceWith := campo,Replace:=2);

      campo:=DMImobiliaria.QImovel_CadDesc_Imovel.Value;
      Doc.Content.Find.Execute(FindText := '%imovel',ReplaceWith := campo,Replace:=2);

      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%endereco_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bairro_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cidade_contratante',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%uf_contratante',ReplaceWith := campo,Replace:=2);

      campo:=FormatFloat('#,##0.00',DMImobiliaria.QLocatario_CadVL_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%valor_aluguel',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(DMImobiliaria.QLocatario_CadVL_CONTRATO.Value,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso_aluguel',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMImobiliaria.QLocatario_CadDt_Emissao.Value);
      Doc.Content.Find.Execute(FindText := '%dt_emissao',ReplaceWith := campo,Replace:=2);
      Doc.SaveAs(Path+'Contrato_opção_locação1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');

end;

procedure TFContratoLocatario_Cad.Extrato1Click(Sender: TObject);
begin
  inherited;
  if FImobiliaria_Param = Nil then
    FImobiliaria_Param := TFImobiliaria_Param.Create(Application);
  FImobiliaria_Param.PGRelatorio.Pages[2].TabVisible := True;
  if FImobiliaria_Param.ShowModal = mrOk then
  with DMImobiliaria do
  begin
    QRExtrato.Close;
    if Trim(FImobiliaria_Param.Fm3Imovel.MEImovel.Text) = '' then
      QRExtrato.SetVariable('COD_IMOVEL',Null)
    else
      QRExtrato.SetVariable('COD_IMOVEL',StrToInt(Trim(FImobiliaria_Param.Fm3Imovel.MEImovel.Text)));
    if Trim(FImobiliaria_Param.Fm3Cadastro.MeCadastro.Text) = '' then
      QRExtrato.SetVariable('COD_PROPRIETARIO',Null)
    else
      QRExtrato.SetVariable('COD_PROPRIETARIO',StrToInt(Trim(FImobiliaria_Param.Fm3Cadastro.MeCadastro.Text)));
    if Trim(FImobiliaria_Param.Fm3Filial.MeFilial.Text) = '' then
      QRExtrato.SetVariable('COD_FILIAL',Null)
    else
      QRExtrato.SetVariable('COD_FILIAL',StrToInt(Trim(FImobiliaria_Param.Fm3Filial.MeFilial.Text)));
    QRExtrato.SetVariable('Dt_Inicio',FImobiliaria_Param.Fm3Datas.MeDtInicial.Text);
    QRExtrato.SetVariable('Dt_Final',FImobiliaria_Param.Fm3Datas.MeDtFinal.Text);
    QRExtrato.Open;
    if FrImobiliaria_Extrato = Nil then
      FrImobiliaria_Extrato := TFrImobiliaria_Extrato.Create(Application);
    if FImobiliaria_Param.RGPreview.ItemIndex = 0 then
       FrImobiliaria_Extrato.QRPrimario.Preview
    else
      FrImobiliaria_Extrato.QRPrimario.Print;
    QRExtrato.Close;
  end;

end;

procedure TFContratoLocatario_Cad.RelatrioComissoImobiliria1Click(
  Sender: TObject);
begin
  inherited;
  if FImobiliaria_Param = Nil then
    FImobiliaria_Param := TFImobiliaria_Param.Create(Application);
  FImobiliaria_Param.PGRelatorio.Pages[3].TabVisible := True;
  if FImobiliaria_Param.ShowModal = mrOk then
  with DMImobiliaria do
  begin
    QRComissao.Close;
    if Trim(FImobiliaria_Param.Fm4Filial.MeFilial.Text) = '' then
      QRComissao.SetVariable('COD_FILIAL',Null)
    else
      QRComissao.SetVariable('COD_FILIAL',StrToInt(Trim(FImobiliaria_Param.Fm4Filial.MeFilial.Text)));
    if Trim(FImobiliaria_Param.Fm4Cadastro.MeCadastro.Text) = '' then
      QRComissao.SetVariable('COD_PROPRIETARIO',Null)
    else
      QRComissao.SetVariable('COD_PROPRIETARIO',StrToInt(Trim(FImobiliaria_Param.Fm4Cadastro.MeCadastro.Text)));
    QRComissao.Open;
    if FrComissaoImobiliaria = Nil then
       FrComissaoImobiliaria := TFrComissaoImobiliaria.Create(Application);
    if FImobiliaria_Param.RGPreview.ItemIndex = 0 then
       FrComissaoImobiliaria.QRPrimario.Preview
    else
       FrComissaoImobiliaria.QRPrimario.Print;
    QRComissao.Close;
  end;

end;

end.
