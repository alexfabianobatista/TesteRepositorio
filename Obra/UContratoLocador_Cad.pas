unit UContratoLocador_Cad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UTCADSIMPLES, ActnList, ImgList, DB, Menus, ComCtrls, StdCtrls,
  Mask, Buttons, ExtCtrls, DBPanel, DBCtrls, ComObj, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TFContratoLocador_Cad = class(TFTCadSimples)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBPanel1: TDBPanel;
    DBPanel2: TDBPanel;
    DBPanel3: TDBPanel;
    DBPanel4: TDBPanel;
    DBRadioGroup1: TDBRadioGroup;
    DBPanel5: TDBPanel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Opo1: TMenuItem;
    GerarContasPagar1: TMenuItem;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    EmissoContrato1: TMenuItem;
    RelatrioContratos1: TMenuItem;
    RelatrioFinanceira1: TMenuItem;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    procedure DBPanel1DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel2DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure DBPanel3DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBPanel4DefineByForm(Sender: TObject;
      var FormConsulta: TPtrForm; var Classe: TFormClass);
    procedure SBConsultaClick(Sender: TObject);
    procedure GerarContasPagar1Click(Sender: TObject);
    procedure EmissoContrato1Click(Sender: TObject);
    procedure RelatrioContratos1Click(Sender: TObject);
    procedure RelatrioFinanceira1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FContratoLocador_Cad: TFContratoLocador_Cad;
  WinWord, Docs, Doc: Variant;

implementation

uses UImobiliaria_cl, UImovel_Cons, UFilialCons, UCadastroCons,
  UContratoLocador_Cons, UContaReceberLocador, UFilial_cl, UCadastro_cl,
  UOracle_cl, uBiblioteca, UImobiliaria_Param, URContrato_Locador,
  URFinanceiroImobiliaria;

{$R *.dfm}

procedure TFContratoLocador_Cad.DBPanel1DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FImovel_Cons;
  Classe := TFImovel_Cons;

end;

procedure TFContratoLocador_Cad.DBPanel2DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FFilialCons;
  Classe := TFFilialCons;

end;

procedure TFContratoLocador_Cad.DBPanel3DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;

end;

procedure TFContratoLocador_Cad.FormActivate(Sender: TObject);
begin
  inherited;
  DMImobiliaria.QLocador_Cad.Open;
end;

procedure TFContratoLocador_Cad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMImobiliaria.QLocador_Cad.Close;
end;

procedure TFContratoLocador_Cad.DBPanel4DefineByForm(Sender: TObject;
  var FormConsulta: TPtrForm; var Classe: TFormClass);
begin
  inherited;
  FormConsulta := @FCadastroCons;
  Classe := TFCadastroCons;
end;

procedure TFContratoLocador_Cad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FContratoLocador_Cons = Nil then
    FContratoLocador_Cons := TFContratoLocador_Cons.Create(Application);
  If FContratoLocador_Cons.ShowModal = mrOk then
  With DMImobiliaria do
  Begin
    QLocador_Cad.Close;
    QLocador_Cad.SetVariable('PK',QLocador_ConsCod_Contrato_Locador.Value);
    QLocador_Cad.Open;
  End;

end;

procedure TFContratoLocador_Cad.GerarContasPagar1Click(Sender: TObject);
begin
  inherited;
  If FContaReceberLocador = Nil then
    FContaReceberLocador := TFContaReceberLocador.Create(Application);
  FContaReceberLocador.ShowModal;

end;

procedure TFContratoLocador_Cad.EmissoContrato1Click(Sender: TObject);
var Path, campo : String;
begin
  inherited;
  if DMImobiliaria.QLocador_CadCOD_CONTRATO_LOCADOR.value <> 0 then
    begin
      Path:=ExtractFilePath(ParamStr(0))+'Contratos\';
      DMFilial.QFilial.Close;
      DMFilial.QFilial.SetVariable('PK',DMImobiliaria.QLocador_CadCOD_FILIAL.Value);
      DMFilial.QFilial.Open;
      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMImobiliaria.QLocador_CadCOD_CADASTRO.Value);
      DMCadastro.QCadastro.Open;
      DMImobiliaria.QImovel_Cad.Close;
      DMImobiliaria.QImovel_Cad.SetVariable('PK',DMImobiliaria.QLocador_CadCOD_IMOVEL.Value);
      DMImobiliaria.QImovel_Cad.Open;
      // Cria objeto principal de controle
      WinWord := CreateOleObject('Word.Application');
      // Mostra o Word
      WinWord.Visible := true;
      // Pega uma interface para o objeto que manipula documentos
      Docs := WinWord.Documents;
      // Abre um Documento
      Doc := Docs.Open(Path+'Contrato_aluguel_Padrão.Doc');
      // Substitui texto via "name parameters"
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%funcao_locador',ReplaceWith := campo,Replace:=2);
      If DMCadastro.QCadastroCod_Estado_Civil.Text <> '' Then
         campo := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL = '+DMCadastro.QCadastroCod_Estado_Civil.Text)
      Else
         campo := ' ';
      Doc.Content.Find.Execute(FindText := '%estado_civil_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%end_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bai_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cid_locador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%uf_locador',ReplaceWith := campo,Replace:=2);

      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMImobiliaria.QImovel_CadCOD_PROPRIETARIO.Value);
      DMCadastro.QCadastro.Open;

      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%funcao_locatario',ReplaceWith := campo,Replace:=2);
      If DMCadastro.QCadastroCod_Estado_Civil.Text <> '' Then
         campo := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL = '+DMCadastro.QCadastroCod_Estado_Civil.Text)
      Else
         campo := ' ';
      Doc.Content.Find.Execute(FindText := '%estado_civil_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMImobiliaria.QImovel_CadDesc_Imovel.Value;
      Doc.Content.Find.Execute(FindText := '%desc_imovel',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Endereco.Value;
      Doc.Content.Find.Execute(FindText := '%end_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Bairro.Value;
      Doc.Content.Find.Execute(FindText := '%bai_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Cidade.Value;
      Doc.Content.Find.Execute(FindText := '%cid_locatario',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroCod_Estado.Value;
      Doc.Content.Find.Execute(FindText := '%uf_locatario',ReplaceWith := campo,Replace:=2);

      DMCadastro.QCadastro.Close;
      DMCadastro.QCadastro.SetVariable('PK',DMImobiliaria.QLocador_CadCOD_FIADOR.Value);
      DMCadastro.QCadastro.Open;
      campo:=DMCadastro.QCadastroNome.Value;
      Doc.Content.Find.Execute(FindText := '%nome_fiador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroDesc_Funcao.Value;
      Doc.Content.Find.Execute(FindText := '%funcao_fiador',ReplaceWith := campo,Replace:=2);
      If DMCadastro.QCadastroCod_Estado_Civil.Text <> '' Then
        campo := DMOracle.BuscaNome('SELECT DESC_ESTADO_CIVIL FROM TB_ESTADO_CIVIL','COD_ESTADO_CIVIL = '+DMCadastro.QCadastroCod_Estado_Civil.Text)
      Else
        campo := ' ';
      Doc.Content.Find.Execute(FindText := '%estado_civil_fiador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Inscricao.Value;
      Doc.Content.Find.Execute(FindText := '%rg_fiador',ReplaceWith := campo,Replace:=2);
      campo:=DMCadastro.QCadastroNum_Cgc_Cpf.Value;
      Doc.Content.Find.Execute(FindText := '%cpf_fiador',ReplaceWith := campo,Replace:=2);
      campo:=FormatFloat('#,##0.00',DMImobiliaria.QLocador_CadVL_CONTRATO.Value);
      Doc.Content.Find.Execute(FindText := '%valor_contrato',ReplaceWith := campo,Replace:=2);
      campo:=Bib.extenso(DMImobiliaria.QLocador_CadVL_CONTRATO.Value,'REAL');
      Doc.Content.Find.Execute(FindText := '%extenso_contrato',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMImobiliaria.QLocador_CadDt_Emissao.Value);
      Doc.Content.Find.Execute(FindText := '%data',ReplaceWith := campo,Replace:=2); 
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMImobiliaria.QLocador_CadDT_INICIO_COBRANCA.Value);
      Doc.Content.Find.Execute(FindText := '%datainicio',ReplaceWith := campo,Replace:=2);
      campo:=FormatDateTime(', dd "de" MMMM "de" yyyy',DMImobiliaria.QLocador_CadDT_FIM_COBRANCA.Value);
      Doc.Content.Find.Execute(FindText := '%datafinal',ReplaceWith := campo,Replace:=2);

      Doc.SaveAs(Path+'Contrato aluguel Padrão1.Doc');
      // Imprime
      //Doc.PrintOut(false);
      // Fecha o Word
//      WinWord.Quit;
    end
   else
     ShowMessage('É Necessário selecionar uma obra.');
end;

procedure TFContratoLocador_Cad.RelatrioContratos1Click(Sender: TObject);
begin
  inherited;
  if FImobiliaria_Param = Nil then
    FImobiliaria_Param := TFImobiliaria_Param.Create(Application);
  FImobiliaria_Param.PGRelatorio.Pages[0].TabVisible := True;
  if FImobiliaria_Param.ShowModal = mrOk then
  with DMImobiliaria do
  begin
    QRContrato_Locador.Close;
    if Trim(FImobiliaria_Param.Fm1Condominio.MeCondominio.Text) = '' then
      QRContrato_Locador.SetVariable('COD_CONDOMINIO',Null)
    else
      QRContrato_Locador.SetVariable('COD_CONDOMINIO',StrToInt(Trim(FImobiliaria_Param.Fm1Condominio.MeCondominio.Text)));
    if Trim(FImobiliaria_Param.Fm1Filial.MEFilial.Text) = '' then
      QRContrato_Locador.SetVariable('COD_FILIAL',Null)
    else
      QRContrato_Locador.SetVariable('COD_FILIAL',StrToInt(Trim(FImobiliaria_Param.Fm1Filial.MEFilial.Text)));
    if Trim(FImobiliaria_Param.Fm1Cadastro.MeCadastro.Text) = '' then
      QRContrato_Locador.SetVariable('COD_PROPRIETARIO',Null)
    else
      QRContrato_Locador.SetVariable('COD_PROPRIETARIO',StrToInt(Trim(FImobiliaria_Param.Fm1Cadastro.MeCadastro.Text)));
    QRContrato_Locador.Open;
    if FRContrato_Locador = Nil then
      FRContrato_Locador := tFRContrato_Locador.Create(Application);
    if FImobiliaria_Param.RGPreview.ItemIndex = 0 then
       FRContrato_Locador.QRPrimario.Preview
    else
      FRContrato_Locador.QRPrimario.Print;
    QRContrato_Locador.Close;
  end;
end;

procedure TFContratoLocador_Cad.RelatrioFinanceira1Click(Sender: TObject);
begin
  inherited;
  if FImobiliaria_Param = Nil then
    FImobiliaria_Param := TFImobiliaria_Param.Create(Application);
  FImobiliaria_Param.PGRelatorio.Pages[1].TabVisible := True;
  if FImobiliaria_Param.ShowModal = mrOk then
  with DMImobiliaria do
  begin
    QRFinanceiro.Close;
    if Trim(FImobiliaria_Param.Fm2Condominio.MeCondominio.Text) = '' then
      QRFinanceiro.SetVariable('COD_CONDOMINIO',Null)
    else
      QRFinanceiro.SetVariable('COD_CONDOMINIO',StrToInt(Trim(FImobiliaria_Param.Fm2Condominio.MeCondominio.Text)));
    if Trim(FImobiliaria_Param.Fm2Imovel.MEImovel.Text) = '' then
      QRFinanceiro.SetVariable('COD_IMOVEL',Null)
    else
      QRFinanceiro.SetVariable('COD_IMOVEL',StrToInt(Trim(FImobiliaria_Param.Fm2Imovel.MEImovel.Text)));
    if Trim(FImobiliaria_Param.Fm2Cadastro.MeCadastro.Text) = '' then
      QRFinanceiro.SetVariable('COD_PROPRIETARIO',Null)
    else
      QRFinanceiro.SetVariable('COD_PROPRIETARIO',StrToInt(Trim(FImobiliaria_Param.Fm2Cadastro.MeCadastro.Text)));
    QRFinanceiro.SetVariable('Dt_Inicio',FImobiliaria_Param.Fm2Datas.MeDtInicial.Text);
    QRFinanceiro.SetVariable('Dt_Final',FImobiliaria_Param.Fm2Datas.MeDtFinal.Text);
    QRFinanceiro.Open;
    if FRFinanceiroImobiliaria = Nil then
      FRFinanceiroImobiliaria := TFRFinanceiroImobiliaria.Create(Application);
    if FImobiliaria_Param.RGPreview.ItemIndex = 0 then
       FRFinanceiroImobiliaria.QRPrimario.Preview
    else
      FRFinanceiroImobiliaria.QRPrimario.Print;
    QRFinanceiro.Close;
  end;

end;

end.
