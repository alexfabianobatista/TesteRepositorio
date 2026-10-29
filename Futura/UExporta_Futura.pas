unit UExporta_Futura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UTCADSIMPLES, ImgList, Db, Menus, ComCtrls, StdCtrls, Mask, Buttons,
  ExtCtrls, variants, maskutils;

type
  TFExporta_Futura = class(TFTCadSimples)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    RbCliente: TCheckBox;
    RbCondicao: TCheckBox;
    RbTitulos: TCheckBox;
    RbProdutos: TCheckBox;
    RbRepresentante: TCheckBox;
    RbMensagem: TCheckBox;
    RbGrupos: TCheckBox;
    RbOperacao: TCheckBox;
    Memo1: TMemo;
    RbNota: TCheckBox;
    GroupBox2: TGroupBox;
    MeData: TMaskEdit;
    Label1: TLabel;
    SpeedButton10: TSpeedButton;
    MeDepartamento: TMaskEdit;
    Label2: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExporta_Futura: TFExporta_Futura;

implementation

uses UExportaFutura_cl, UOracle_cl, UParamSistema_cl, UDepartamentoCons,
  UDepartamento_cl;

{$R *.DFM}

{ Função converte espacos em branco/ponto/virgula em zeros }
function StrZero(Num : Real ; Zeros,Deci: integer): string;
var V : String;
    Z : Integer;
begin

  Str(Num:Zeros:Deci, V);
  Trim(V);
  { Convert spaces to zeroes }
  while Pos(' ', V) > 0 do
  begin
    V[Pos(' ', V)] := '0'
  end;

  while ( Pos('.', V) > 0 ) or ( Pos(',', V) > 0 ) do
  begin
    z := Pos('.',V);     // Pega posição
    Delete(V,z,1);      // Deleta na posição.
    Insert('0',V,1);    // Inclui 0 na primeira posicao.
  end;
  Result := V;
end;

procedure TFExporta_Futura.BitBtn1Click(Sender: TObject);
Var
  F : TextFile;
  S, wCep,wCnpj,wInscricao,wExtensao,wDD,wMM,wAA,wEmpresa : String;
  S1,S2,S3,S4,S5,S6,S7,S8 : String;
  wI, wContador : Integer;
  wPreco, wVal_Frete : Real;
begin
  inherited;
{  If DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE' Then
   Begin
     wExtensao := '001';
     wEmpresa := '1';
   End
  Else
   Begin
     wExtensao := '002';
     wEmpresa := '2';
   End;   }
  wExtensao := 'TXT';
  wContador := 0;
  With DMExportaFutura do
  Begin
    If RbCliente.Checked Then
     Begin
       QExportaCadastro.Close;
       If Trim(MeDepartamento.Text) <> '' Then
          QExportaCadastro.SetVariable('COD_DEPARTAMENTO',Trim(MeDepartamento.Text))
       Else
          QExportaCadastro.SetVariable('COD_DEPARTAMENTO',Null);
       QExportaCadastro.Open;
        s := '';
       While Not QExportaCadastro.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ);
         S := S + StrZero(QExportaCadastroCod_Vendedor.Value,6,0);
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + '00000000'+StrZero(QExportaCadastroCod_Cadastro.Value,6,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroNome.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Endereco.Value);
         wI := 1;
         wCep := '';
         while wI <= Length(QExportaCadastroDesc_Cep.Value) do
         begin
           if ( Copy(QExportaCadastroDesc_Cep.Value, wI, 1) >= '0' ) and
              ( Copy(QExportaCadastroDesc_Cep.Value, wI, 1) <= '9' ) then
              wCep := wCep + Copy(QExportaCadastroDesc_Cep.Value,wI,1) ;
              Inc(wI,1);
         end;
         S := S + FormatMaskText('CCCCCCCC',wCep);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Bairro.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Cidade.Value);
         S := S + FormatMaskText('CC',QExportaCadastroCod_Estado.Value);
         wI := 1;
         wCnpj := '';
         while wI <= Length(QExportaCadastroNum_Cgc_Cpf.Value) do
         begin
           if ( Copy(QExportaCadastroNum_Cgc_Cpf.Value, wI, 1) >= '0' ) and
              ( Copy(QExportaCadastroNum_Cgc_Cpf.Value, wI, 1) <= '9' ) then
              wCnpj := wCnpj + Copy(QExportaCadastroNum_Cgc_Cpf.Value,wI,1) ;
              Inc(wI,1);
         end;
         S := S + FormatMaskText('CCCCCCCCCCCCCC',wCnpj);
         wI := 1;
         wInscricao := '';
         while wI <= Length(QExportaCadastroNum_Inscricao.Value) do
         begin
           if ( Copy(QExportaCadastroNum_Inscricao.Value, wI, 1) >= '0' ) and
              ( Copy(QExportaCadastroNum_Inscricao.Value, wI, 1) <= '9' ) then
              wInscricao := wInscricao + Copy(QExportaCadastroNum_Inscricao.Value,wI,1) ;
              Inc(wI,1);
         end;
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',wInscricao);
         S := S + FormatMaskText('CCCCCCCCCCCCCCC',QExportaCadastroDesc_Telefone.Value);
//       S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QExportaCadastroDesc_Obs.Value);
         S := S + '                              ';  // o Luister solicitou que a obs fica-se em branco porque no futura se tiver qualquer caracter neste campo é cadastro cancelado
         S := S + StrZero((QExportaCadastroVal_Limite.Value * 100),8,0)+Chr(13)+Chr(10);
         QExportaCadastro.Next;
         inc(wContador);
         if wContador = 5000 Then
          Begin
            S1 := S;
            S := '';
          end;
         If wContador = 10000 Then
          Begin
            S2 := S;
            S := '';
          end;
         If wContador = 15000 Then
          Begin
            S3 := S;
            S := '';
          end;
         If wContador = 20000 Then
          Begin
            S4 := S;
            S := '';
          end;
         If wContador = 25000 Then
          Begin
            S5 := S;
            S := '';
          end;
         If wContador = 30000 Then
          Begin
            S6 := S;
            S := '';
          end;
         If wContador = 35000 Then
          Begin
            S7 := S;
            S := '';
          end;
       End;
       S8 := S;
       S := S1 + S2 + S3 + S4 + S5 + S6 + S7 + S8;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTCLIEN.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
    End;
// ATE AQUI EXPORTOU O CADASTRO DE CLIENTES
// AQUI COMEÇA EXPORTAÇÃO CONDICAO DE PAGAMENTO
    If RbCondicao.Checked Then
     Begin
       QCondicaoPagto.Close;
       QCondicaoPagto.Open;
       s := '';
       While Not QCondicaoPagto.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ);
         S := S + '000000';
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + StrZero(QCondicaoPagtoCod_Prazo_Vencimento.Value,4,0);
         S := S + '000';
//         S := S + StrZero(QCondicaoPagtoNum_Dias.Value,3,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCC',QCondicaoPagtoDesc_Prazo_Vencimento.Value);
         S := S + '000000000000+';
         S := S + StrZero(QCondicaoPagtoNum_Parcelas.Value,1,0) + Chr(13)+Chr(10);
         QCondicaoPagto.Next;
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTCPGTO.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU AS CONDICOES DE PAGAMENTO
    If RbTitulos.Checked Then
     Begin
       QContasReceber.Close;
       If Trim(MeDepartamento.Text) <> '' Then
          QContasReceber.SetVariable('COD_DEPARTAMENTO',Trim(MeDepartamento.Text))
       Else
          QContasReceber.SetVariable('COD_DEPARTAMENTO',Null);
       QContasReceber.Open;
       s := '';
       While Not QContasReceber.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ);
         S := S + StrZero(QContasReceberCod_Vendedor.Value,6,0);
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + StrZero(QContasReceberCod_Cadastro.Value,14,0);
         S := S + FormatMaskText('CC',QContasReceberDesc_Tipo_Documento.Value);
         S := S + StrZero(QContasReceberNum_Titulo.Value,7,0);
         S := S + FormatMaskText('CC',QContasReceberNum_Parcela.Text);
         S := S + FormatDateTime('ddmmyy',QContasReceberDt_Vencimento.Value);
         S := S + StrZero((QContasReceberVal_Titulo.Value * 100),9,0)+Chr(13)+Chr(10);
         QContasReceber.Next;
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTDUPLI.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU AS CONTAS A RECEBER
    If RbRepresentante.Checked Then
     Begin
       QVendedor.Close;
       If Trim(MeDepartamento.Text) <> '' Then
          QVendedor.SetVariable('COD_DEPARTAMENTO',Trim(MeDepartamento.Text))
       Else
          QVendedor.SetVariable('COD_DEPARTAMENTO',Null);
       QVendedor.Open;
       s := '';
       While Not QVendedor.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ);
         S := S + StrZero(QVendedorCod_Vendedor.Value,6,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QVendedorNome.Value);
         wI := 1;
         wCnpj := '';
         while wI <= Length(QVendedorDesc_Cpf.Value) do
         begin
           if ( Copy(QVendedorDesc_Cpf.Value, wI, 1) >= '0' ) and
              ( Copy(QVendedorDesc_Cpf.Value, wI, 1) <= '9' ) then
              wCnpj := wCnpj + Copy(QVendedorDesc_Cpf.Value,wI,1) ;
              Inc(wI,1);
         end;
         If wCnpj <> '' Then
            S := S + StrZero(StrToFloat(wCnpj),14,0)+'N'
         Else
            S := S + '00000000000000N';
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + 'SN'+Chr(13)+Chr(10)
         Else
            S := S + 'NS'+Chr(13)+Chr(10);
         QVendedor.Next;
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTREPRE.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU OS REPRESENTANTES (VENDEDORES)
// AQUI COMEÇA A EXPORTAR CADASTROS DE PRODUTOS
    If RbProdutos.Checked Then
     Begin
       QProduto.Close;
       If Trim(MeDepartamento.Text) <> '' Then
          QProduto.SetVariable('COD_DEPARTAMENTO',Trim(MeDepartamento.Text))
       Else
          QProduto.SetVariable('COD_DEPARTAMENTO',Null);
       QProduto.Open;
       S := '';
       While Not QProduto.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ);
         S := S + StrZero(QProdutoCod_Vendedor_Tb.Value,6,0);
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + StrZero(QProdutoCod_Produto.Value,7,0)+'000';
         S := S + Copy(StrZero(QProdutoCod_Classe.Value,6,0),5,2);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCC',QProdutoDesc_Produto.Value)+' ';
         S := S + FormatMaskText('CCCCCCC',QProdutoDesc_Complemento.Value);
         S := S + FormatMaskText('CC',QProdutoDesc_Unidade.Value);
         S := S + StrZero((QProdutoNum_Embalagem.Value),5,0);
         S := S + StrZero((QProdutoNum_Embalagem.Value*100),6,0);
         S := S + '000000000';

         wVal_Frete := 0;
         If QProdutoVal_Frete_Pocket.Value > 0 Then
            wVal_Frete := QProdutoVal_Frete_Pocket.Value * QProdutoNum_Embalagem.Value;

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco1.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco1.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + copy(StrZero(QProdutoQt_Quantidade1.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto1.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo1.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco2.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco2.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade2.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto2.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo2.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco3.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco3.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade3.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto3.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo3.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco4.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco4.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade4.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto4.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo4.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco5.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco5.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade5.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto5.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo5.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco6.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco6.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade6.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto6.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo6.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco7.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco7.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade7.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto7.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo7.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco8.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco8.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade8.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto8.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo8.Value * 100),4,0);

         wPreco := QProdutoVal_Varejo.Value + QProdutoVal_Preco9.Value + wVal_Frete;
         If QProdutoPerc_Icms_Pocket.Value <> 0 Then
            wPreco := wPreco + QProdutoVal_Preco9.Value * QProdutoPerc_Icms_Pocket.Value / 100;
         S := S + Copy(StrZero(QProdutoQt_Quantidade9.Value,6,0),2,5);
         S := S + StrZero((wPreco * 100),7,0);
         S := S + StrZero((QProdutoPerc_Desconto9.Value * 100),4,0);
         S := S + StrZero((QProdutoPerc_Acrescimo9.Value * 100),4,0)+Chr(13)+Chr(10);
         QProduto.Next;
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTPRODU.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// ATE AQUI EXPORTOU O CADASTRO DE PRODUTOS
    If RbMensagem.Checked Then
     Begin
       QMensagem.Close;
       QMensagem.Open;
       S := '';
       While Not QMensagem.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ);
         S := S + StrZero(QMensagemCod_Vendedor.Value,6,0)+'00000';
         S := S + StrZero(QMensagemCod_Vendedor.Value,6,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemNome.Value)+'                ';
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_01.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_02.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_03.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_04.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_05.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_06.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_07.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_08.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_09.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_10.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_11.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_12.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_13.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_14.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_15.Value);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QMensagemDesc_Mens_16.Value)+Chr(13)+Chr(10);
         QMensagem.Next;
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTMENSA.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// AQUI COMEÇA EXPORTAR O CADASTRO DE OPERAÇÕES
    If RbOperacao.Checked Then
     Begin
       QOperacao.Close;
       QOperacao.Open;
       S := '';
       While Not QOperacao.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ)+'000000';
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + StrZero(QOperacaoCod_Operacao.Value,4,0);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCC',QOperacaoDesc_Resumo.Value);
         If QOperacaoInd_Bonificacao.Value = 'S' Then
            S := S + '2' + Chr(13)+Chr(10)
         Else If QOperacaoInd_Troca.Value = 'S' Then
                S := S + '3' + Chr(13)+Chr(10)
             Else
                S := S + '1'+ Chr(13)+Chr(10);
        QOperacao.Next;
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTOPERA.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// AQUI COMEÇA EXPORTAR O CADASTRO DE GRUPO DE PRODUTOS
    If RbGrupos.Checked Then
     Begin
       QGrupo.Close;
       QGrupo.Open;
       S := '';
       While Not QGrupo.Eof Do
       Begin
         S := S + '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ)+'000000';
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + Copy(StrZero(QGrupoCod_Classe.Value,6,0),5,2);
         S := S + FormatMaskText('CCCCCCCCCCCCCCCCCCCCCCCCCCCCCC',QGrupoDesc_Classe.Value)+Chr(13)+Chr(10);
         QGrupo.Next;             
       End;
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTGRUPO.'+wExtensao );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// AQUI COMEÇA EXPORTAR AS NOTAS FISCAIS FATURADAS
    If RbNota.Checked Then
     Begin
       QNotas.Close;
       If Trim(MeDepartamento.Text) <> '' Then
          QNotas.SetVariable('COD_DEPARTAMENTO',Trim(MeDepartamento.Text))
       Else
          QNotas.SetVariable('COD_DEPARTAMENTO',Null);
       QNotas.SetVariable('Dt_Referencia',MeData.Text);
       QNotas.Open;
       S := '';
       While Not QNotas.Eof Do
       Begin
         If QNotasInd_Vendas.Value = 'V' Then
            S := S + '0'
         Else
            S := S + '1';
         wDD := Copy(QNotasDt_Emissao.Text,1,2);
         wMM := Copy(QNotasDt_Emissao.Text,4,2);
         wAA := Copy(QNotasDt_Emissao.Text,9,2);
         S := S + wDD+wMM+wAA;
         S := S + '0000';
         S := S + StrZero(QNotasCod_Vendedor.Value,6,0);
         If (DMParamSistema.QParamSistemaCod_Empresa.Value = 'FAVILLE') or
            (DMParamSistema.QParamSistemaCod_Empresa.Value = 'MOINHO') Then
            S := S + '1'
         Else
            S := S + '2';
         S := S + StrZero(QNotasCod_Cadastro.Value,14,0);
         S := S + StrZero(QNotasNum_Nota.Value,7,0);
         S := S + StrZero(QNotasCod_Produto.Value,7,0);
         S := S + StrZero(Trunc(QNotasQt_Quantidade.Value),6,0);
         S := S + StrZero((QNotasVal_Unitario.Value*100),7,0)+Chr(13)+Chr(10);
         QNotas.Next;
       End;
       wDD := Copy(MeData.Text,1,2);
       wMM := Copy(MeData.Text,4,2);
       wAA := Copy(MeData.Text,9,2);
       AssignFile( F, 'C:\FUTURA\FROMHOST\HSTV'+wAA+wMM+'.'+wDD+wEmpresa );
       Rewrite(F);
       Writeln(F, S);
       CloseFile(F);
     End;
// aqui gera um arquivo para indicar que terminou a exportacao
    S := '2' + FormatDateTime('ddmmyyhhmm',DMOracle.DataHoraServ)+'0000';
    S := S + DMParamSistema.QParamSistemaCod_Empresa.Value;
    AssignFile( F, 'C:\FUTURA\FROMHOST\HSTFINAL.'+wExtensao );
    Rewrite(F);
    Writeln(F, S);
    CloseFile(F);
  End;
end;
procedure TFExporta_Futura.FormActivate(Sender: TObject);
begin
  inherited;
  MeData.Text := DateToStr(Date);
end;

procedure TFExporta_Futura.SpeedButton10Click(Sender: TObject);
begin
  inherited;
  if FDepartamentoCons = nil then
    FDepartamentoCons := TFDepartamentoCons.Create(Application);
  if FDepartamentoCons.ShowModal = MrOk then
     MEDepartamento.Text:=DMDepartamento.QDepartamentoConsCod_Departamento.Text;
end;

end.

