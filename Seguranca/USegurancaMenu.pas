unit USegurancaMenu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTMENUPRINCIPAL, Menus, ExtCtrls, StdCtrls, FileCtrl, Grids, Outline,
  DirOutln, Buttons, variants, ImgList, ComCtrls;

type
  TFSegurancaMenu = class(TFTMenuPrincipal)
    Manuteno1: TMenuItem;
    Grupo1: TMenuItem;
    Usurio1: TMenuItem;
    Tela1: TMenuItem;
    Funo1: TMenuItem;
    N1: TMenuItem;
    Auditoria1: TMenuItem;
    UsurioFilial1: TMenuItem;
    Dispositivos1: TMenuItem;
    procedure Grupo1Click(Sender: TObject);
    procedure Usurio1Click(Sender: TObject);
    procedure Tela1Click(Sender: TObject);
    procedure Funo1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ControleInterno1Click(Sender: TObject);
    procedure Excluircontroleinterno1Click(Sender: TObject);
    procedure Auditoria1Click(Sender: TObject);
    procedure UsurioFilial1Click(Sender: TObject);
    procedure Dispositivos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSegurancaMenu: TFSegurancaMenu;

implementation

uses UGrupoCad, UUsuarioCad, UTelaCad, UTela_cl, UFuncaoCad,
  UControleInternoParam, UControleInterno_cl, URControleInterno, UOracle_cl,
  UAditoria_cl, URAuditoria, UUsuarioFilialCad, UAuditoriaParam, UUsuario_cl,
  UAuditoriaCons, UDispositivoCad;

{$R *.DFM}

procedure TFSegurancaMenu.Grupo1Click(Sender: TObject);
begin
  inherited;
  If FGrupoCad = Nil then
    FGrupoCad := TFGrupoCad.Create(Application);
  // Verificar se a tela esta cadastrada
  DMTela.VerificaTela(pMODULO,FGrupoCad.Caption,FGrupoCad.Name);
  FGrupoCad.ShowModal;
end;

procedure TFSegurancaMenu.Usurio1Click(Sender: TObject);
begin
  inherited;
  If FUsuarioCad = Nil then
    FUsuarioCad := TFUsuarioCad.Create(Application);
  DMTela.VerificaTela(pModulo,FUsuarioCad.Caption,FUsuarioCad.Name);
  FUsuarioCad.ShowModal;
end;

procedure TFSegurancaMenu.Tela1Click(Sender: TObject);
begin
  inherited;
  If FTelaCad = Nil then
    FTelaCad := TFTelaCad.Create(Application);
  DMTela.VerificaTela(pModulo,FTelaCad.Caption,FTelaCad.Name);
  FTelaCad.ShowModal;
end;

procedure TFSegurancaMenu.Funo1Click(Sender: TObject);
begin
  inherited;
  If FFuncaoCad = Nil then
    FFuncaoCad := TFFuncaoCad.Create(Application);
  DMTela.VerificaTela(pModulo,FFuncaoCad.Caption,FFuncaoCad.Name);
  FFuncaoCad.ShowModal;
end;

procedure TFSegurancaMenu.FormCreate(Sender: TObject);
begin
  inherited;
  pModulo := 'SEGURANCA';
end;

procedure TFSegurancaMenu.ControleInterno1Click(Sender: TObject);
begin
  inherited;

  if FControleInternoParam = nil then
     FControleInternoParam := TFControleInternoParam.Create(Application);

  DMTela.VerificaTela(pModulo,FControleInternoParam.Caption,FControleInternoParam.Name);
  FControleInternoParam.PGRelatorio.Pages[0].TabVisible := True;

  if FControleInternoParam.ShowModal =  mrOk then
  begin
    if (Trim(FControleInternoParam.ME0_DtInicial.Text) = '') or
       (Trim(FControleInternoParam.ME0_DtFinal.Text) = '') then
       raise exception.Create('Data inicio e final não podem ficar em branco!');

    with DMControleInterno do
    begin
      QRControleInterno.Close;
      if Trim(FControleInternoParam.ME0_Filial.Text) <> '' then
         QRControleInterno.SetVariable('FILIAL',FControleInternoParam.ME0_Filial.Text)
      else
         QRControleInterno.SetVariable('FILIAL',Null);

      if Trim(FControleInternoParam.ME0_Usuario.Text) <> '' then
         QRControleInterno.SetVariable('USUARIO',FControleInternoParam.ME0_Usuario.Text)
      else
         QRControleInterno.SetVariable('USUARIO',Null);

      if Trim(FControleInternoParam.ME0_DtInicial.Text) <> '' then
         QRControleInterno.SetVariable('DATA_I',StrToDate(FControleInternoParam.ME0_DtInicial.text));

      if Trim(FControleInternoParam.ME0_DtFinal.Text) <> '' then
         QRControleInterno.SetVariable('DATA_F',StrToDate(FControleInternoParam.ME0_DtFinal.text));

      if FControleInternoParam.CKB_Todos.Checked = False then
         QRControleInterno.SetVariable('MODULO',FControleInternoParam.DBLookupCB0_Mod.Text)
      else
         QRControleInterno.SetVariable('MODULO',Null);

      QRControleInterno.Open;

      if FRControleInterno =  nil then
         FRControleInterno := TFRControleInterno.create(Application);

      FRControleInterno.QRlEmpresa.Caption := 'Filial:' + FControleInternoParam.ED0_Filial.Text;
      FRControleInterno.QRLPeriodo.Caption := 'Periodo de : '+
      FControleInternoParam.ME0_DtInicial.Text+' até '+FControleInternoParam.ME0_DtFinal.Text;

      if FControleInternoParam.RGPreview.ItemIndex = 0 then
         FRControleInterno.QRPrimario.Preview
      else
         FRControleInterno.QRPrimario.Print;

      QRControleInterno.Close;

    end;
  end;
end;

procedure TFSegurancaMenu.Excluircontroleinterno1Click(Sender: TObject);
begin
  inherited;
  if FControleInternoParam = nil then
     FControleInternoParam := TFControleInternoParam.Create(Application);

  FControleInternoParam.PGRelatorio.Pages[1].TabVisible := True;

  if FControleInternoParam.ShowModal = mrOk then
  begin

    if (Trim(FControleInternoParam.ME1DataI.Text) = '') or
       (Trim(FControleInternoParam.ME1DataI.Text) = '') then
       raise exception.Create('Data ínicio e final não podem ficar em branco!');

    if MessageDlg('Deseja realmente excluir informações do controle interno?',
                   mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      with DMControleInterno do
      begin
        QControleInternoExcluir.Close;

        if Trim(FControleInternoParam.ME1CodFilial.Text) = '' then
           QControleInternoExcluir.SetVariable('FILIAL',Null)
        else
           QControleInternoExcluir.SetVariable('FILIAL',FControleInternoParam.ME1CodFilial.Text);

        if Trim(FControleInternoParam.ME1CodUsuario.Text) = '' then
           QControleInternoExcluir.SetVariable('USUARIO',Null)
        else
           QControleInternoExcluir.SetVariable('USUARIO',FControleInternoParam.ME1CodUsuario.Text);

        QControleInternoExcluir.SetVariable('DATA_I',StrToDate(FControleInternoParam.ME1DataI.Text));

        QControleInternoExcluir.SetVariable('DATA_F',StrToDate(FControleInternoParam.ME1DataF.Text));

        QControleInternoExcluir.Open;

        if QControleInternoExcluir.RecordCount = 0 then
           raise exception.Create('Nada para excluir dentro dos parametros informados!');

        if DMOracle.DBCemapa.InTransaction = False then
           DMOracle.DBCemapa.StartTransaction;

        try
          QControleInternoExcluir.First;
          while not QControleInternoExcluir.Eof do
          begin
            QControleInternoExcluir.Delete;
            QControleInternoExcluir.Next;
          end;
          DMOracle.DBCemapa.Commit;
        except
          DMOracle.DBCemapa.Rollback;
          raise Exception.Create('Erro ! Não foi possível excluir este Registro');
        end;
      end;
    end;
  end;
end;

procedure TFSegurancaMenu.Auditoria1Click(Sender: TObject);
begin
  inherited;

  If FAuditoriaCons = nil then
    FAuditoriaCons := TFAuditoriaCons.Create(Application);
    FAuditoriaCons.ShowModal;
  //DMTela.VerificaTela(pmodulo, FAuditoriaCons.Caption,FAuditoriaCons.Name);


  {if FControleInternoParam = nil then
     FControleInternoParam := TFControleInternoParam.Create(Application);

  DMTela.VerificaTela(pModulo,FControleInternoParam.Caption,FControleInternoParam.Name);
  FControleInternoParam.PGRelatorio.Pages[2].TabVisible := True;

  if FControleInternoParam.ShowModal =  mrOk then
  begin
    if (Trim(FControleInternoParam.ME2DtInicial.Text) = '') or
       (Trim(FControleInternoParam.ME2DtFinal.Text) = '') then
       raise exception.Create('Data inicio e final não podem ficar em branco!');

    with DMAuditoria do
    begin
      QRAuditoria.Close;
      if Trim(FControleInternoParam.ME2Usuario.Text) <> '' then
         QRAuditoria.SetVariable('COD_USUARIO',Trim(FControleInternoParam.ME2Usuario.Text))
      else
         QRAuditoria.SetVariable('COD_USUARIO',Null);
      QRAuditoria.SetVariable('DATA_I',StrToDate(FControleInternoParam.ME2DtInicial.text));
      QRAuditoria.SetVariable('DATA_F',StrToDate(FControleInternoParam.ME2DtFinal.text));
      QRAuditoria.Open;

      if FRAuditoria =  nil then
         FRAuditoria := TFRAuditoria.create(Application);

      if FControleInternoParam.RGPreview.ItemIndex = 0 then
         FRAuditoria.QRPrimario.Preview
      else
         FRAuditoria.QRPrimario.Print;

      QRAuditoria.Close;
    end;}
  //end;
end;

procedure TFSegurancaMenu.UsurioFilial1Click(Sender: TObject);
begin
  inherited;
  If FUsuarioFilialCad  = Nil then
    FUsuarioFilialCad := TFUsuarioFilialCad.Create(Application);
  DMTela.VerificaTela(pModulo,FUsuarioFilialCad.Caption,FUsuarioFilialCad.Name);
  FUsuarioFilialCad.ShowModal;

end;

procedure TFSegurancaMenu.Dispositivos1Click(Sender: TObject);
var
  wNomeUsuario: String;
begin
  inherited;
  wNomeUsuario := DMOracle.FastSelect('NOME','TB_USUARIO','COD_USUARIO = ' + IntToStr(dmusuario.CodUsuarioCorrente));
  if wNomeUsuario = 'CEMAPA' then
  begin
    If FDispositivoCad  = Nil then
      FDispositivoCad := TFDispositivoCad.Create(Application);
    DMTela.VerificaTela(pModulo,FDispositivoCad.Caption,FDispositivoCad.Name);
    FDispositivoCad.ShowModal;
  end
  else
    ShowMessage('Menu não liberado para este usuário, qualquer dúvida entre em contato com o Suporte Cemapa.');
end;

end.
