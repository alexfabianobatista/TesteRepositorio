unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, Mask;

type
  TForm1 = class(TForm)
    pcConfig: TPageControl;
    TSDadosECF: TTabSheet;
    sdArquivoConfig: TSaveDialog;
    odAbrirArquivoConfig: TOpenDialog;
    GroupBox1: TGroupBox;
    LBECFs: TListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    TSDadosEmpresa: TTabSheet;
    edCNPJ: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edIE: TEdit;
    Label4: TLabel;
    edIM: TEdit;
    Label5: TLabel;
    edDenominacao: TEdit;
    Label6: TLabel;
    edNomePaf: TEdit;
    Label7: TLabel;
    edVersaoPAF: TEdit;
    bt0Novo: TBitBtn;
    bt0Abrir: TBitBtn;
    bt0Gravar: TBitBtn;
    bt0Cancelar: TBitBtn;
    bt1Novo: TBitBtn;
    bt1Abrir: TBitBtn;
    bt1Gravar: TBitBtn;
    bt1Cancelar: TBitBtn;
    Label8: TLabel;
    edGrandeTotal: TMaskEdit;
    EdMD5: TEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure bt0NovoClick(Sender: TObject);
    procedure bt0AbrirClick(Sender: TObject);
    procedure bt0GravarClick(Sender: TObject);
    procedure bt0CancelarClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edGrandeTotal1Exit(Sender: TObject);
    procedure pcConfigChanging(Sender: TObject; var AllowChange: Boolean);
    procedure bt1NovoClick(Sender: TObject);
    procedure bt1AbrirClick(Sender: TObject);
    procedure bt1GravarClick(Sender: TObject);
    procedure bt1CancelarClick(Sender: TObject);
    procedure edGrandeTotalEnter(Sender: TObject);
  private
    CaminhoArquivoECF: String;
    CaminhoArquivoEmpresa: String;
    procedure gravaConfiguracoesECF;
    procedure carregaConfiguracoesECF;
    procedure atualizaBotoesECF;
    procedure gravaConfiguracoesEmpresa;
    procedure carregaConfiguracoesEmpresa;
    procedure atualizaBotoesEmpresa;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses UBiblioteca;

{$R *.dfm}

procedure TForm1.BitBtn1Click(Sender: TObject);
var
  wNumSerie: String;
  i: Integer;
begin
  if InputQuery('Informe o valor', 'Digite o número de série do novo ECF', wNumSerie) then
  begin
    wNumSerie := trim(wNumSerie);
    if wNumSerie = '' then
      MessageDlg('Número de série não informado', mtError, [mbOK], 0)
    else
    begin
      for i := 0 to LBECFs.Count -1 do
        if wNumSerie = LBECFs.Items[i] then
          raise Exception.Create('Número de série já informado!');
      LBECFs.Items.Add(wNumSerie);
    end;
  end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  LBECFs.DeleteSelected;
end;

procedure TForm1.bt0NovoClick(Sender: TObject);
begin
  sdArquivoConfig.Filter := 'ArquivoTexto|config.txt';
  sdArquivoConfig.FileName := 'Config.txt';
  if sdArquivoConfig.Execute then
  begin
    if FileExists(sdArquivoConfig.FileName) then
    begin
      if (MessageDlg('Arquivo já existe. Deseja sobrescrevê-lo?', mtWarning, [mbYes, mbCancel], 0) = mrCancel) then
        Abort
      else
      begin
        CaminhoArquivoECF := sdArquivoConfig.FileName;
        carregaConfiguracoesECF;
      end;
    end
    else
      CaminhoArquivoECF := sdArquivoConfig.FileName;
    atualizaBotoesECF;
  end
  else
     MessageDlg('Nenhum arquivo selecionado!', mtWarning,[mbOk], 0);
end;

procedure TForm1.bt0AbrirClick(Sender: TObject);
begin
  odAbrirArquivoConfig.Filter := 'ArquivoTexto|config.txt';
  odAbrirArquivoConfig.FileName := 'Config.txt';
  if odAbrirArquivoConfig.Execute then
  begin
    CaminhoArquivoECF := odAbrirArquivoConfig.FileName;
    carregaConfiguracoesECF;
    atualizaBotoesECF;
  end
  else
     MessageDlg('Nenhum arquivo selecionado!', mtWarning,[mbOk], 0);
end;

procedure TForm1.carregaConfiguracoesECF;
var
  arq: TextFile;
  wLinha: String;
  wValorGT: Integer;
begin
  AssignFile (arq, CaminhoArquivoECF);
  Reset(arq);
  while not Eof(arq) do
  begin
    ReadLn (arq, wLinha);
    if Trim(wLinha) = '[ECF]' then  //Encontrou inicio da sessão
    begin
      ReadLn (arq, wLinha);
      while Trim(wLinha) <> '[/ECF]' do
      begin
        LBECFs.Items.Add(Bib.Decode(wLinha));
        ReadLn (arq, wLinha);
      end;
    end;
    if Trim(wLinha) = '[GT]' then
    begin
      ReadLn (arq, wLinha);
      if Trim(wLinha) <> '[/GT]' then
      begin
        edGrandeTotal.Text := Bib.decode(wLinha);
      end;
    end;
    if Trim(wLinha) = '[MD5]' then
    begin
      ReadLn (arq, wLinha);
      EdMD5.Text := Bib.Decode(wLinha);
    end;
  end;
  CloseFile(arq);
end;

procedure TForm1.gravaConfiguracoesECF;
var
  arq: TextFile;
  wLinha: String;
  i: Integer;
begin
  //Cria backup do arquivo com um '~' concatenado antes da extenção do arquivo
  if FileExists(CaminhoArquivoECF) then
    CopyFile(PAnsiChar(CaminhoArquivoECF), PAnsiChar(copy(CaminhoArquivoECF, 1, length(CaminhoArquivoECF)-3) + '~' + copy(CaminhoArquivoECF, length(CaminhoArquivoECF)-2, 3)), false);
  AssignFile(arq,CaminhoArquivoECF);
  Rewrite(arq);
  Writeln(arq,'[ECF]');
  for i := 0 to LBECFs.Count -1 do
  begin
    wLinha := LBECFs.Items[i];
    Writeln(arq,Bib.Encode(wLinha));
  end;
  Writeln(arq,'[/ECF]');
  Writeln(arq,'[GT]');
  Writeln(arq, Bib.Encode(Bib.SubstituiStr(edGrandeTotal.Text, ',', '')));
  Writeln(arq,'[/GT]');
  Writeln(arq,'[MD5]');
  Writeln(arq, Bib.Encode(EdMD5.Text));
  Writeln(arq,'[/MD5]');
  CloseFile(arq);
end;

procedure TForm1.bt0GravarClick(Sender: TObject);
begin
  gravaConfiguracoesECF;
  CaminhoArquivoECF := '';
  atualizaBotoesECF;
end;

procedure TForm1.atualizaBotoesECF;
begin
  bt0Novo.Enabled := CaminhoArquivoECF = '';
  bt0Abrir.Enabled := CaminhoArquivoECF = '';
  bt0Gravar.Enabled := CaminhoArquivoECF <> '';
  bt0Cancelar.Enabled := CaminhoArquivoECF <> '';
  if CaminhoArquivoECF = '' then
  begin
    LBECFs.Clear;
    edGrandeTotal.Clear;
  end;
end;

procedure TForm1.bt0CancelarClick(Sender: TObject);
begin
  CaminhoArquivoECF := '';
  atualizaBotoesECF;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  ;
end;

procedure TForm1.edGrandeTotal1Exit(Sender: TObject);
begin
  try
    strtofloat(edGrandeTotal.Text);
  except
    edGrandeTotal.SetFocus;
    edGrandeTotal.SelectAll;
    raise;
  end;
end;

procedure TForm1.atualizaBotoesEmpresa;
begin
  bt1Novo.Enabled := CaminhoArquivoEmpresa = '';
  bt1Abrir.Enabled := CaminhoArquivoEmpresa = '';
  bt1Gravar.Enabled := CaminhoArquivoEmpresa <> '';
  bt1Cancelar.Enabled := CaminhoArquivoEmpresa <> '';
  if CaminhoArquivoEmpresa = '' then
  begin
    edCNPJ.Clear;
    edIE.Clear;
    edIM.Clear;
    edDenominacao.Clear;
    edNomePaf.Clear;
    edVersaoPAF.Clear;
  end;
end;

procedure TForm1.carregaConfiguracoesEmpresa;
var
  arqEmpresa: TextFile;
  wLinha: String;
begin
  AssignFile (arqEmpresa, CaminhoArquivoEmpresa);
  Reset(arqEmpresa);
  ReadLn (arqEmpresa, wLinha);
  if Trim(wLinha) = '[PAF]' then
  begin
    ReadLn (arqEmpresa, wLinha);
    edCNPJ.Text := Bib.Decode(wLinha);
    ReadLn (arqEmpresa, wLinha);
    edIE.Text := Bib.Decode(wLinha);
    ReadLn (arqEmpresa, wLinha);
    edIM.Text := Bib.Decode(wLinha);
    ReadLn (arqEmpresa, wLinha);
    edDenominacao.Text := Bib.Decode(wLinha);
    ReadLn (arqEmpresa, wLinha);
    edNomePaf.Text := Bib.Decode(wLinha);
    ReadLn (arqEmpresa, wLinha);
    edVersaoPAF.Text := Bib.Decode(wLinha);
  end;
  CloseFile(arqEmpresa);
end;

procedure TForm1.gravaConfiguracoesEmpresa;
var
  arq: TextFile;
  wLinha: String;
  i: Integer;
begin
  //Cria backup do arquivo com um '~' concatenado antes da extenção do arquivo
  if FileExists(CaminhoArquivoEmpresa) then
    CopyFile(PAnsiChar(CaminhoArquivoEmpresa), PAnsiChar(copy(CaminhoArquivoEmpresa, 1, length(CaminhoArquivoEmpresa)-3)
      + '~' + copy(CaminhoArquivoEmpresa, length(CaminhoArquivoEmpresa)-2, 3)), false);
  AssignFile(arq,CaminhoArquivoEmpresa);
  Rewrite(arq);
  Writeln(arq,'[PAF]');
  Writeln(arq, Bib.Encode(edCNPJ.Text));
  Writeln(arq, Bib.Encode(edIE.Text));
  Writeln(arq, Bib.Encode(edIM.Text));
  Writeln(arq, Bib.Encode(edDenominacao.Text));
  Writeln(arq, Bib.Encode(edNomePaf.Text));
  Writeln(arq, Bib.Encode(edVersaoPAF.Text));
  Writeln(arq,'[/PAF]');
  CloseFile(arq);
end;

procedure TForm1.pcConfigChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := (CaminhoArquivoECF = '') and (CaminhoArquivoEmpresa = '');
end;

procedure TForm1.bt1NovoClick(Sender: TObject);
begin
  sdArquivoConfig.Filter := 'ArquivoTexto|ConfigEmpresa.txt';
  sdArquivoConfig.FileName := 'ConfigEmpresa.txt';
  if sdArquivoConfig.Execute then
  begin
    if FileExists(sdArquivoConfig.FileName) then
    begin
      if (MessageDlg('Arquivo já existe. Deseja sobrescrevê-lo?', mtWarning, [mbYes, mbCancel], 0) = mrCancel) then
        Abort
      else
      begin
        CaminhoArquivoEmpresa := sdArquivoConfig.FileName;
        carregaConfiguracoesEmpresa;
      end;
    end
    else
      CaminhoArquivoEmpresa := sdArquivoConfig.FileName;
    atualizaBotoesEmpresa;
  end
  else
     MessageDlg('Nenhum arquivo selecionado!', mtWarning,[mbOk], 0);
end;

procedure TForm1.bt1AbrirClick(Sender: TObject);
begin
  odAbrirArquivoConfig.Filter := 'ArquivoTexto|ConfigEmpresa.txt';
  odAbrirArquivoConfig.FileName := 'ConfigEmpresa.txt';
  if odAbrirArquivoConfig.Execute then
  begin
    CaminhoArquivoEmpresa := odAbrirArquivoConfig.FileName;
    carregaConfiguracoesEmpresa;
    atualizaBotoesEmpresa;
  end
  else
     MessageDlg('Nenhum arquivo selecionado!', mtWarning,[mbOk], 0);
end;

procedure TForm1.bt1GravarClick(Sender: TObject);
begin
  gravaConfiguracoesEmpresa;
  CaminhoArquivoEmpresa := '';
  atualizaBotoesEmpresa;
end;procedure TForm1.bt1CancelarClick(Sender: TObject);
begin
  CaminhoArquivoEmpresa := '';
  atualizaBotoesEmpresa;
end;



procedure TForm1.edGrandeTotalEnter(Sender: TObject);
begin
  edGrandeTotal.SelectAll;
end;

end.

{gravar
  Writeln(arq,'[PAF]');
  Writeln(arq, Bib.Encode(edCNPJ.Text));
  Writeln(arq, Bib.Encode(edIE.Text));
  Writeln(arq, Bib.Encode(edIM.Text));
  Writeln(arq, Bib.Encode(edDenominacao.Text));
  Writeln(arq, Bib.Encode(edNomePaf.Text));
  Writeln(arq, Bib.Encode(edVersaoPAF.Text));
  Writeln(arq,'[/PAF]');


  carregar
  if Trim(wLinha) = '[PAF]' then
    begin
      ReadLn (arq, wLinha);
      edCNPJ.Text := Bib.Decode(wLinha);
      ReadLn (arq, wLinha);
      edIE.Text := Bib.Decode(wLinha);
      ReadLn (arq, wLinha);
      edIM.Text := Bib.Decode(wLinha);
      ReadLn (arq, wLinha);
      edDenominacao.Text := Bib.Decode(wLinha);
      ReadLn (arq, wLinha);
      edNomePaf.Text := Bib.Decode(wLinha);
      ReadLn (arq, wLinha);
      edVersaoPAF.Text := Bib.Decode(wLinha);
    end;


    botoes
  edCNPJ.Clear;
    edIE.Clear;
    edIM.Clear;
    edDenominacao.Clear;
    edNomePaf.Clear;
    edVersaoPAF.Clear;
}
