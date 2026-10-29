unit UFuncionarioCad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, StdCtrls, Buttons, DBCtrls, ImgList, Db, Menus, ComCtrls,
  Mask, ExtCtrls, Grids, DBGrids, variants, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ActnList;

type
  TFFuncionarioCad = class(TFTCadSimples)
    RelaodeFuncionrios1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    BtConsCategoria: TBitBtn;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit11: TDBEdit;
    Label11: TLabel;
    DBEdit12: TDBEdit;
    BTCidadeCons: TBitBtn;
    DBEdit13: TDBEdit;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    Opes1: TMenuItem;
    Exames1: TMenuItem;
    TabSheet2: TTabSheet;
    Label12: TLabel;
    DBEdit14: TDBEdit;
    Label13: TLabel;
    DBEdit15: TDBEdit;
    Label14: TLabel;
    DBEdit16: TDBEdit;
    Label15: TLabel;
    DBEdit17: TDBEdit;
    Label16: TLabel;
    DBEdit18: TDBEdit;
    Label17: TLabel;
    DBEdit19: TDBEdit;
    Label18: TLabel;
    DBEdit20: TDBEdit;
    Label19: TLabel;
    DBEdit21: TDBEdit;
    Label23: TLabel;
    DBEdit25: TDBEdit;
    Label28: TLabel;
    DBEdit30: TDBEdit;
    Label25: TLabel;
    DBEdit27: TDBEdit;
    TabSheet3: TTabSheet;
    Label20: TLabel;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    Label21: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label24: TLabel;
    DBEdit26: TDBEdit;
    Label29: TLabel;
    DBEdit31: TDBEdit;
    Label30: TLabel;
    DBEdit32: TDBEdit;
    Label31: TLabel;
    DBEdit33: TDBEdit;
    Label32: TLabel;
    DBEdit34: TDBEdit;
    Label34: TLabel;
    DBEdit36: TDBEdit;
    Label35: TLabel;
    DBEdit37: TDBEdit;
    Label36: TLabel;
    DBEdit38: TDBEdit;
    DBRadioGroup2: TDBRadioGroup;
    DBRadioGroup3: TDBRadioGroup;
    BTFilialCons: TBitBtn;
    BTDepartamentoCons: TBitBtn;
    BTFuncaoCons: TBitBtn;
    BTEstadoCivilCons: TBitBtn;
    DBEdit35: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    Dependentes: TTabSheet;
    Label26: TLabel;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    Label27: TLabel;
    DBEdit24: TDBEdit;
    Label22: TLabel;
    Label33: TLabel;
    DBEdit42: TDBEdit;
    Label38: TLabel;
    DBEdit44: TDBEdit;
    Label40: TLabel;
    DBEdit46: TDBEdit;
    Label41: TLabel;
    DBEdit47: TDBEdit;
    Bevel1: TBevel;
    DBNDependente: TDBNavigator;
    DBGrid1: TDBGrid;
    RelExamesFuncionrio1: TMenuItem;
    RelFuncionriosporFuno1: TMenuItem;
    DBEdit43: TDBEdit;
    Label37: TLabel;
    procedure BtConsCategoriaClick(Sender: TObject);
    procedure DSPrimarioStateChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBConsultaClick(Sender: TObject);
    procedure RelaodeFuncionrios1Click(Sender: TObject);
    procedure BTCidadeConsClick(Sender: TObject);
    procedure Exames1Click(Sender: TObject);
    procedure BTFilialConsClick(Sender: TObject);
    procedure BTDepartamentoConsClick(Sender: TObject);
    procedure BTEstadoCivilConsClick(Sender: TObject);
    procedure BTFuncaoConsClick(Sender: TObject);
    procedure RelExamesFuncionrio1Click(Sender: TObject);
    procedure RelFuncionriosporFuno1Click(Sender: TObject);
    procedure SBHelpClick(Sender: TObject);
    procedure SBConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFuncionarioCad: TFFuncionarioCad;

implementation

uses UFuncionario_cl, UCategoriaCons, UCategoriaProfissional_cl,
  UFFuncionarioCons, UrFuncionario, UCidadeCons, UCidade_cl,
  UExameFuncionarioCad, UExameFuncionario_cl, UFilialCons,
  UDepartamentoCons, UFuncaoFuncionarioCons, UFilial_cl, UDepartamento_cl,
  UFuncaoFuncionario_cl, UEstadoCivilCons, UEstadoCivil_cl, USegurancaParam,
  URExameFuncionario, URFuncionarioFuncao, UBiblioteca, MaskUtils;// UFCategoriaCad;

{$R *.DFM}

procedure TFFuncionarioCad.BtConsCategoriaClick(Sender: TObject);
begin
  inherited;
  If FCategoriaCons = Nil then
    FCategoriaCons := TFCategoriaCons.Create(Application);
  If FCategoriaCons.showModal = mrOk then
    DMFuncionario.QFuncionarioCod_Categoria.Value := DMCategoriaProfissional.QCategoriaConsCod_Categoria.Value;
end;

procedure TFFuncionarioCad.DSPrimarioStateChange(Sender: TObject);
begin
  inherited;
  If DSPrimario.State in [DSInsert,DSEdit] then
  begin
    BtConsCategoria.Enabled:=True;
    BTFilialCons.Enabled:=True;
    BTDepartamentoCons.Enabled:=True;
    BTEstadoCivilCons.Enabled:=True;
    BTFuncaoCons.Enabled:=True;
    BTCidadeCons.Enabled:=True;
    DBNDependente.Enabled := True;
  end
  Else
  begin
    BtConsCategoria.Enabled:=false;
    BTFilialCons.Enabled:=false;
    BTDepartamentoCons.Enabled:=false;
    BTEstadoCivilCons.Enabled:=false;
    BTFuncaoCons.Enabled:=false;
    BTCidadeCons.Enabled:=false;
    DBNDependente.Enabled := False;
  end;
end;

procedure TFFuncionarioCad.FormActivate(Sender: TObject);
begin
  inherited;
  With DmFuncionario do
  Begin
    QFuncionario.Close;
    QFuncionario.Open;
    QDependente.Open;
  End;

end;

procedure TFFuncionarioCad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  With DmFuncionario do
    QFuncionario.Close;
  Action := CaFree;
  FFuncionarioCad := Nil;
end;

procedure TFFuncionarioCad.SBConsultaClick(Sender: TObject);
begin
  inherited;
  If FFuncionarioCons = Nil then
    FFuncionarioCons := TFFuncionarioCons.Create(Application);
  If FFuncionarioCons.ShowModal = mrOk then
  With DMFuncionario do
  Begin
    QFuncionario.Close;
    QFuncionario.SetVariable('PK',QFuncionarioConsCod_Funcionario.Value);
    QFuncionario.Open;
  End;
end;

procedure TFFuncionarioCad.RelaodeFuncionrios1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[5].TabVisible := True;
  if FSegurancaParam.showModal = mrOk then
  begin
    with DMFuncionario do
    begin
      QRFuncionario.Close;

      if Trim(FSegurancaParam.ME6Filial.Text) <> '' then
        QRFuncionario.SetVariable('FILIAL',StrToInt(Trim(FSegurancaParam.ME6Filial.Text)))
      else
        QRFuncionario.SetVariable('FILIAL',Null);
        
      if FSegurancaParam.RG6TipoFuncionario.ItemIndex = 0 then
        QRFuncionario.SetVariable('TIPO_FUNCIONARIO','EFETIVO')
      else if FSegurancaParam.RG6TipoFuncionario.ItemIndex = 1 then
        QRFuncionario.SetVariable('TIPO_FUNCIONARIO','TERCEIRIZADO')
      else
        QRFuncionario.SetVariable('TIPO_FUNCIONARIO',Null);

      if FSegurancaParam.RG6Situacao.ItemIndex = 0 then
        QRFuncionario.SetVariable('SITUACAO','Ativo')
      else if FSegurancaParam.RG6Situacao.ItemIndex = 1 then
        QRFuncionario.SetVariable('SITUACAO','Afastado')
      else if FSegurancaParam.RG6Situacao.ItemIndex = 2 then
        QRFuncionario.SetVariable('SITUACAO','Desligado')
      else
        QRFuncionario.SetVariable('SITUACAO',Null);

      QRFuncionario.Open;

      if FRFuncionario = Nil then
        FRFuncionario := TFRFuncionario.Create(Application);
      FRFuncionario.QRLFilial.Caption := 'Filial: '+FSegurancaParam.Ed6Filial.Text;
      FRFuncionario.QRPrimario.Preview;
      QRFuncionario.Close;
    End;
  end;
end;

procedure TFFuncionarioCad.BTCidadeConsClick(Sender: TObject);
begin
  inherited;
  if FCidadeCons = Nil then                               
    FCidadeCons := TFCidadeCons.Create(Application);
  if FCidadeCons.showModal = mrOk then
    DMFuncionario.QFuncionarioCod_Cidade.Value := DMCidade.QCidadeConsCod_Cidade.Value;
end;

procedure TFFuncionarioCad.Exames1Click(Sender: TObject);
begin
  inherited;
  if Trim(DMFuncionario.QFuncionarioCod_Funcionario.Text) = '' then
    raise exception.Create('É necessário escolher um funcionário');
  if FExameFuncionarioCad = nil then
     FExameFuncionarioCad := TFExameFuncionarioCad.create(Application);
  with DMExameFuncionario do
  begin
    QExameFuncionario.close;
    QExameFuncionario.setVariable('COD_FUNCIONARIO',DMFuncionario.QFuncionarioCod_Funcionario.Value);
    QExameFuncionario.Open;
  end;
  FExameFuncionarioCad.showModal;
  
end;

procedure TFFuncionarioCad.BTFilialConsClick(Sender: TObject);
begin
  inherited;
  if FFilialCons = Nil then
    FFilialCons := TFFilialCons.Create(Application);
  if FFilialCons.showModal = mrOk then
    DMFuncionario.QFuncionarioCod_Filial.Value := DMFilial.QFilialConsCod_Filial.Value;
end;

procedure TFFuncionarioCad.BTDepartamentoConsClick(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = Nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.showModal = mrOk then
    DMFuncionario.QFuncionarioCod_Departamento.Value := DMDepartamento.QDepartamentoConsCod_Departamento.Value;
end;

procedure TFFuncionarioCad.BTEstadoCivilConsClick(Sender: TObject);
begin
  inherited;
If FEstadoCivilCons = Nil then
    FEstadoCivilCons := TFEstadoCivilCons.Create(Application);
  If FEstadoCivilCons.ShowModal = mrOk then
    DMFuncionario.QFuncionarioCod_Estado_Civil.Value := DMEstadoCivil.QEstadoCivilConsCod_Estado_Civil.Value;
end;

procedure TFFuncionarioCad.BTFuncaoConsClick(Sender: TObject);
begin
  inherited;
  if FFuncaoFuncionarioCons = Nil then
    FFuncaoFuncionarioCons := TFFuncaoFuncionarioCons.Create(Application);
  if FFuncaoFuncionarioCons.showModal = mrOk then
    DMFuncionario.QFuncionarioCod_Funcao_Funcionario.Value := DMFuncaoFuncionario.QFuncaoFuncionarioConsCod_Funcao_Funcionario.Value;
end;

procedure TFFuncionarioCad.RelExamesFuncionrio1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[6].TabVisible := True;
  if FSegurancaParam.showModal = mrOk then
  begin
    with DMFuncionario do
    begin
      QRExameFuncionario.Close;

      if Trim(FSegurancaParam.ME7Inicio.Text) = '' then
        Raise Exception.Create('Data íncial deve ser Informada');
      if Trim(FSegurancaParam.ME7Fim.Text) = '' then
        FSegurancaParam.ME7Fim.Text := DateToStr(Date);
      QRExameFuncionario.SetVariable('DATA_I',StrToDate(Trim(FSegurancaParam.ME7Inicio.Text)));
      QRExameFuncionario.SetVariable('DATA_F',StrToDate(Trim(FSegurancaParam.ME7Fim.Text)));

      if Trim(FSegurancaParam.ME7Filial.Text) <> '' then
        QRExameFuncionario.SetVariable('FILIAL',StrToInt(Trim(FSegurancaParam.ME7Filial.Text)))
      else
        QRExameFuncionario.SetVariable('FILIAL',Null);

      if Trim(FSegurancaParam.ME7TipoExame.Text) <> '' then
        QRExameFuncionario.SetVariable('TIPO_EXAME',StrToInt(Trim(FSegurancaParam.ME7TipoExame.Text)))
      else
        QRExameFuncionario.SetVariable('TIPO_EXAME',Null);

      if Trim(FSegurancaParam.ME7Exame.Text) <> '' then
        QRExameFuncionario.SetVariable('EXAME',StrToInt(Trim(FSegurancaParam.ME7Exame.Text)))
      else
        QRExameFuncionario.SetVariable('EXAME',Null);

      QRExameFuncionario.Open;

      if FRExameFuncionario = Nil then
        FRExameFuncionario := TFRExameFuncionario.Create(Application);
      FRExameFuncionario.QRLFilial.Caption := 'Filial: '+FSegurancaParam.Ed7Filial.Text;
      FRExameFuncionario.QRLPeriodo.Caption := 'Período de '+FSegurancaParam.ME7Inicio.Text+
                                               ' Até '+FSegurancaParam.ME7Fim.Text;
      FRExameFuncionario.QRPrimario.Preview;
      QRExameFuncionario.Close;
    end;
  end;
end;

procedure TFFuncionarioCad.RelFuncionriosporFuno1Click(Sender: TObject);
begin
  inherited;
  if FSegurancaParam = nil then
    FSegurancaParam := TFSegurancaParam.Create(Application);
  FSegurancaParam.PGRelatorio.Pages[7].TabVisible := True;
  if FSegurancaParam.showModal = mrOk then
  begin
    with DMFuncionario do
    begin
      QRFuncionarioFuncao.Close;

      if Trim(FSegurancaParam.ME8FuncaoFuncionario.Text) <> '' then
        QRFuncionarioFuncao.SetVariable('FUNCAO_FUNCIONARIO',StrToInt(Trim(FSegurancaParam.ME8FuncaoFuncionario.Text)))
      else
        QRFuncionarioFuncao.SetVariable('FUNCAO_FUNCIONARIO',Null);

      if Trim(FSegurancaParam.ME8Filial.Text) <> '' then
        QRFuncionarioFuncao.SetVariable('FILIAL',StrToInt(Trim(FSegurancaParam.ME8Filial.Text)))
      else
        QRFuncionarioFuncao.SetVariable('FILIAL',Null);

      QRFuncionarioFuncao.Open;

      if FRFuncionarioFuncao = Nil then
        FRFuncionarioFuncao := TFRFuncionarioFuncao.Create(Application);
      FRFuncionarioFuncao.QRLFilial.Caption := 'Filial: '+FSegurancaParam.Ed8Filial.Text;
      FRFuncionarioFuncao.QRPrimario.Preview;
      QRFuncionarioFuncao.Close;
    end;
  end;
end;

procedure TFFuncionarioCad.SBHelpClick(Sender: TObject);
begin
  inherited;
  Application.HelpContext(10);
end;

procedure TFFuncionarioCad.SBConfirmarClick(Sender: TObject);
begin
  If DBEdit16.Text = '   .   .   -  ' Then
    raise exception.Create('Preencha o campo CPF!')
  else
    If Not (Bib.ValidaCPF(DBEdit16.Text)) Then
       raise exception.Create('CPF Inválido!');

  If trim(DBEdit17.Text) = '' Then
    raise exception.Create('Preencha o campo RG!');

  inherited;

end;

end.
